jsPlumb.ready(function() {
  jsPlumb.makeSource($('.mBox'), {
    connector: 'StateMachine'
  });
  jsPlumb.makeTarget($('.mBox'), {
    anchor: 'Continuous'
  });
});