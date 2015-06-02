$(document).ready(function() {

    jsPlumb.ready(function() {


        jsPlumb.registerConnectionTypes({
            "basic": {
                paintStyle: {
                    strokeStyle: "black",
                    lineWidth: 2
                },
                hoverPaintStyle: {
                    strokeStyle: "red",
                    lineWidth: 2
                },
                cssClass: "connector-normal"
            },
            "selected": {
                paintStyle: {
                    strokeStyle: "red",
                    lineWidth: 2
                },
                hoverPaintStyle: {
                    lineWidth: 4
                },
                cssClass: "connector-selected"
            }
        });

        



        var connectionCreate = function() {
            $('.related').each(function(i, obj) {
                element0 = $(this).attr('class').split(' ')[1]
                element1 = $(this).attr('id')
                console.log(element0)
                console.log(element1)
                jsPlumb.connect({
                    source: $("#" + element0),
                    target: $("#" + element1),
                    type: "basic"
                });

            });
        }

        connectionCreate()




        $('.mBox').draggable({
            drag: function() {
                jsPlumb.repaintEverything(); // (or) jsPlumb.repaintEverything(); to repaint the connections and endpoints
                //followed by your code
                var offset = $(this).offset();
                var xPos = offset.left;
                var yPos = offset.top;
                console.log('x: ' + xPos);
                console.log('y: ' + yPos);

            }
        });


    });

});
