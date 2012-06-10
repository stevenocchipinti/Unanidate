//= require_tree ./models
//= require_tree ./controllers
//= require_tree ./views
//= require_tree ./helpers
//= require_tree ./templates
//= require_tree ./states
//= require_self

// specify the adapter for accessing with ember-data
Unanidate.store = DS.Store.create({
  adapter: DS.RESTAdapter.create({bulkCommit: false}),
  revision: 4
})

// Unanidate.stateManager is useful for debugging,
// but don't use it directly in application code.
var stateManager = Unanidate.stateManager = Unanidate.StateManager.create();
Unanidate.initialize(stateManager);

jQuery(function() {
  stateManager.send('ready');
});

