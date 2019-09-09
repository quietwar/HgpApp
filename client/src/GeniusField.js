import React from 'react';

const GeniusField = ({ record = {}, source }) =>
    <a href={record[source]}>
        {record[source]}
    </a>;

export default GeniusField;
