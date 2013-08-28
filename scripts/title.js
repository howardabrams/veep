$(function(){

  $("#chapters li a").button();

  $("#history").button().click( function(){
  });

  $("#stars").width( window.innerWidth );
  $("#stars").height( window.innerHeight );
  $("#planets").width( window.innerWidth );
  $("#planets").height( window.innerHeight );

  var ctx = $('#stars').get(0).getContext('2d');
  ctx.fillStyle = "#ffffff";

  for(var s = 0; s < 100; s++) {
    var x = Math.random() * 800;
    var y = Math.random() * 800;
    var size = Math.random() * 3;
    var colorR = Math.random() * 30 + 225;
    var colorG = Math.random() * 30 + 225;
    var colorB = Math.random() * 30 + 225;

    $("#stars").drawEllipse({
      fillStyle: "rgb(" + colorR + "," + colorG + "," + colorB +")",
      x: Math.round(x), y: Math.round(y),
      width: size, height: size
    });
  }

});
