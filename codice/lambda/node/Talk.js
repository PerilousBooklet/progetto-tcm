const mongoose = require('mongoose');

// Crea una sorta di db locale con mongoos, esso permette di effettuare le operazioni
const talk_schema = new mongoose.Schema({
    title: String,
    url: String,
    description: String,
    speakers: String,
	qa: Array
}, { collection: 'tedx_data' });

module.exports = mongoose.model('talk', talk_schema);