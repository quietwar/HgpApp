class AdminsController < ApplicationController

    respond_to :html



    respond_to :json

      # def get_events
      #   @task = current_user.tasks
      #   events = []
      #   @task.each do |task|
      #     events << {:id => task.id, :title => "#{task.taskable.try(:name)} : #{task.task}", :start => "#{task.planned_start_date}",:end => "#{task.planned_end_date}" }
      #   end
      #   render :text => events.to_json
    #  end

    def show

    end

    def new

    end

    def edit

    end


    def create

    end

    def destroy
      # session[:user_id] = nil
      # redirect_to root_path
    end

    def update
      # flash[:notice] = 'Event was successfully updated' if @event.update(event_params)
      # respond_with(@event)
    end

    def destroy
      @event.destroy
      respond_with(@event)
    end

    # def redirect
    #   client = Signet::OAuth2::Client.new(client_options)
    #
    #   redirect_to client.authorization_uri.to_s
    # end

    def redirect
      client = Signet::OAuth2::Client.new({
        client_id: '81909937110-9qkbu78955ge23fhinrkkv1ih2cl13sh.apps.googleusercontent.com',
        client_secret: "6raMG_ql1d-EwxAOnwbMP1B3",
        authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
        scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
        redirect_uri: ["http://localhost:3000/users/auth/google_oauth2/callback"]#url_for(:action => :callback)
      })

      redirect_to client.authorization_uri.to_s
    end

    def callback
      client = Signet::OAuth2::Client.new(client_options)
      client.code = params[:code]

      response = client.fetch_access_token!

      session[:authorization] = response

      redirect_to calendars_url
    end


    def calendars
      byebug
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

    def events
      byebug
      client = Signet::OAuth2::Client.new(client_options)
      client.update!(session[:authorization])

      service = Google::Apis::CalendarV3::CalendarService.new
      service.authorization = client

      @event_list = service.list_events(params[:calendar_id])
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
         summary: 'New HGP event!'
       })

       service.insert_event(params[:calendar_id], event)

       redirect_to event_url(calendar_id: params[:calendar_id])
     end

    private

      def client_options
        {
          client_id: '81909937110-9qkbu78955ge23fhinrkkv1ih2cl13sh.apps.googleusercontent.com',
          client_secret: Figaro.env.GOOGLE_CLIENT_SECRET!,
          authorization_uri: 'https://accounts.google.com/o/oauth2/auth',
          token_credential_uri: 'https://accounts.google.com/o/oauth2/token',
          scope: Google::Apis::CalendarV3::AUTH_CALENDAR,
          redirect_uri: callback_url
        }
      end

      def set_event
        @event = Event.find(params[:id])
      end

      def event_params
        params.require[:event].permit(:event, :title, :notes, :dates)
      end
  end
