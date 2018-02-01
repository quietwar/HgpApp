class SchedulesController < ApplicationController

  def redirect
    client = Signet::OAuth2::Client.new

    redirect_to client.authorization_uri.to_s
  end



  def callback
    client = Signet::OAuth2::Client.new(client_options)
    client.code = params[:code]

    response = client.fetch_access_token!

    session[:authorization] = response

    redirect_to calendars_url
  end

  def make_google_calendar_reservations
    @schedule = @cohort.schedules.find_by(slug:
      params[:slug])
    @calendar = GoogleCalWrapper.new(current_user)
    @calendar.book_rooms(@schedule)
  end

class GoogleCalendarWrapper

  def initialize(current_user)
    configure_client(current_user)
  end

  def configure_client(current_user)
    @client = Google::APIClient.new
    @client.authorization.access_token = current_user.token
    @client.authorization.refresh_token = current_user.refresh_token
    @client.authorization.client_id = ENV['GOOGLE_CLIENT_ID']
    @client.authorization.client_secret = ENV['GOOGLE_CLIENT_SECRET']
    @client.authorization.refresh!
    @service = @client.discovered_api('calendar', 'v3')
    response = @client.execute(api_method: @service.calendar_list.list)
  end

  def events
    client = Signet::OAuth2::Client.new(client_options)
    client.update!(session[:authorization])

    service = Google::Apis::CalendarV3::CalendarService.new
    service.authorization = client

    @event_list = service.list_events(params[:calendar_id])
  end

  def calendars
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])

      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client

      @calendar_list = service.list_calendar_lists
    rescue Google::Apis::AuthorizationError
      response = client.refresh!

      session[:authorization] = session[:authorization].merge(response)

      retry
    end

    def new_event
        client = Signet::OAuth2::Client.new(client_options)
        client.update!(session[:authorization])

        service = Google::Apis::CalendarV3::CalendarService.new
        service.authorization = client

        today = Date.today

        event = Google::Apis::CalendarV3::Event.new({
          start: Google::Apis::CalendarV3::EventDateTime.new(date: today),
          end: Google::Apis::CalendarV3::EventDateTime.new(date: today + 1),
          summary: 'New event!'
        })

        service.insert_event(params[:calendar_id], event)

        redirect_to events_url(calendar_id: params[:calendar_id])
    end

  def calendar_id(schedule)
    response = @client.execute(api_method:
      @service.calendar_list.list)
    calendars = JSON.parse(response.body)
    calendar = calendars["items"].select {|cal|
      cal["id"].downcase == schedule.calendar_id}
    calendar["id"]

    @client.execute(api_method: @service.freebusy.query,
      body: JSON.dump({timeMin: start_time,
      timeMax: end_time,
      timeZone: "EST",
      items: [calendar_id]}),
      headers: {'Content-Type' => 'application/json'})

      @client.execute(:api_method => @service.events.insert,
        :parameters => {'calendarId' => calendar_id,
          'sendNotifications' => true},
        :body => JSON.dump(event),
        :headers => {'Content-Type' => 'application/json'})

      private

      def client_options
        {
          client_id: Rails.application.secrets.google_client_id,
          client_secret: Rails.application.secrets.google_client_secret,
          authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
          token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
          scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
          redirect_uri: callback_url
        }
      end


      end
    end
  end
