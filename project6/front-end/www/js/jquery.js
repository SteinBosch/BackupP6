// (function(){
// 	function graph_exist () {
// 		setTimeout(function(){
// 			if ($(".graph").attr("data-graph").length) {
// 		    	graph();
// 		    }
// 		}, 505);
// 	}

// 	function graph () {
// 		var graph_array = $(".graph").attr("data-graph");
// 		graph_array = JSON.parse(graph_array);
// 		//console.log(graph_array);
// 		var array_length = graph_array.length;

// 		var heighest = Math.max.apply(Math,graph_array); 
// 		var lowest = Math.min.apply(Math,graph_array);
// 		//console.log(heighest, lowest);
// 		$(".graph_header").append("<h2>Angstscore <div class='score s"+lowest+"'><div>"+lowest+"</div></div></h2>");
// 		for (i = heighest/10; i > (lowest-10)/10; --i) { 
// 		    //console.log(i);
// 		    $(".count").append("<div class='graph_numb'>"+(i*10)+"<div class='graph_line'></div></div>");
// 		}
// 		var difference = ((heighest - lowest)/10)+1;
// 		var heightOfGraph = $(".graph_points").height();
// 		var widthOfGraph = $(".graph_points").width();
// 		$(".count div.graph_numb").css("height", heightOfGraph/difference);
// 		//console.log(heightOfGraph, difference);

// 		$.each(graph_array, function( index, value ) {
// 			// console.log(heighest-value);
// 			// console.log(((heighest-value)/10)*(heightOfGraph/difference));
// 			$(".graph_points").append("<div class='graph_point' style='margin-top:"+((heighest-value)/10)*(heightOfGraph/difference)+"px; margin-left:"+(index)*(widthOfGraph/(array_length))+"px;'></div>")
// 		  //console.log( index + ": " + value );
// 		});

// 		// line function
// 		(function(e){var t={createLine:function(e,t,n,r,i){var s=navigator.userAgent.indexOf("MSIE")>-1;if(n<e){var o=e;e=n;n=o;o=t;t=r;r=o}var u=document.createElement("div");u.setAttribute("id", "line");var a=Math.sqrt((e-n)*(e-n)+(t-r)*(t-r));u.style.width=a+"px";u.style.borderBottom=i.stroke+"px solid";u.style.borderColor=i.color;u.style.position="absolute";u.style.zIndex=i.zindex;if(s){u.style.top=r>t?t+"px":r+"px";u.style.left=e+"px";var f=(n-e)/a;var l=(r-t)/a;u.style.filter="progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11="+f+", M12="+ -1*l+", M21="+l+", M22="+f+")"}else{var c=Math.atan((r-t)/(n-e));u.style.top=t+.5*a*Math.sin(c)+"px";u.style.left=e-.5*a*(1-Math.cos(c))+"px";u.style.MozTransform=u.style.WebkitTransform=u.style.OTransform="rotate("+c+"rad)"}return u}};e.fn.line=function(n,r,i,s,o,u){return e(this).each(function(){if(e.isFunction(o)){callback=o;o=null}else{callback=u}o=e.extend({},e.fn.line.defaults,o);e(this).append(t.createLine(n,r,i,s,o)).promise().done(function(){if(e.isFunction(callback)){callback.call()}})})};e.fn.line.defaults={zindex:1e4,color:"#000000",stroke:"1"}})(jQuery);
		
// 		var graph_points = $('.graph_point');
// 		//console.log(graph_points);
// 		// $.each(graph_points, function( index, value ) {
			
// 		//   console.log( index + ": " + value.offsetTop );
// 		// });

// 		for (i = 0; i < graph_points.length-1; i++) { 
			
// 			var currenttop = parseInt($(graph_points[i]).css('margin-top'),10);
// 			var currentleft = parseInt($(graph_points[i]).css('margin-left'),10);
// 		   	var nexttop = parseInt($(graph_points[i+1]).css('margin-top'),10);
// 		   	var nextleft = parseInt($(graph_points[i+1]).css('margin-left'),10);
// 		   	//console.log(currenttop, currentleft, nexttop, nextleft);

// 		   	$(".graph_points").line(currentleft+7, currenttop+7, nextleft+7, nexttop+7, {color:"#454545", stroke:2, zindex:0},function(){ $(this).addClass('line'); });
// 		}


// 	}

// routie({
//     '/app/oefening/:id': function() {
//     	setTimeout(function(){
// 			graph_exist();
// 		}, 200);
//     },
// });
	
// })();