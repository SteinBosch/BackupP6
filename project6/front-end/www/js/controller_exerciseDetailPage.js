angular.module('starter.ExerciseDetailCtrl', ['dataservices'])

.controller('ExerciseDetailCtrl', ['$scope', 'dataService', 'localStorage', '$timeout', '$ionicModal', '$ionicSideMenuDelegate', '$state', '$stateParams', "$http", function($scope, dataService, localStorage, $timeout, $ionicModal, $ionicSideMenuDelegate, $state, $stateParams, $http){
  


  var data = localStorage.getObject('userdata');
  if (data) {
    $scope.oefeningen = data.Exercises;
 
    //MODAL FOR DETAIL RESULTS EXERCISES
    $scope.oefeningModal = {};

    var ID = $stateParams.id;
    // Aanmaken van de dataset van de geopende modal
    $scope.ThisoefeningModal = {};
    for (var i=0; i<=$scope.oefeningen.length - 1; i++){

        if ($scope.oefeningen[i].ID == ID ) {
          $scope.ThisoefeningModal = $scope.oefeningen[i];
        };

    }
    console.log($scope.ThisoefeningModal);
      // Datum omreken funcite
      if ($scope.ThisoefeningModal.Messages) {

        for (var i=0; i<=$scope.ThisoefeningModal.Messages.length - 1; i++){

          var date = $scope.ThisoefeningModal.Messages[i].Date.split('-');

          var monthNames = ["januarie", "februari", "maart", "april", "mei", "juni", "juli", "augustus", "september", "oktober", "november", "december"];
          var monthValue = monthNames[date[1]-1];

          $scope.ThisoefeningModal.Messages[i].WrittenDate = date[0] + ' ' + monthValue + ' ' + date[2];
        }

      }

      // Sluiten oefening modal
      $scope.oefeningModalClose = function() {
        delete $scope.fearScores;
        delete $scope.error;
      };

      // Aanmaken van de array van alle fearscores binnen 1 oefening
      $scope.fearScores = [];
      
      if ($scope.ThisoefeningModal.Messages) {

        for (var i=0; i<=$scope.ThisoefeningModal.Messages.length - 1; i++){
            $scope.fearScores.push($scope.ThisoefeningModal.Messages[i].FearScore);
        }

        $scope.fearScores = JSON.stringify($scope.fearScores);
      }

      //console.log($scope.fearScores);

      //Stein's Graph jQuery compressed & uitvoering
      function graph(){var e=JSON.parse($scope.fearScores);var t=e.length;var n=Math.max.apply(Math,e);var r=Math.min.apply(Math,e);$(".graph_header").append("<h2>Angstscore <div class='score s"+r+"'><div>"+r+"</div></div></h2>");for(i=n/10;i>(r-10)/10;--i){$(".count").append("<div class='graph_numb'>"+i*10+"<div class='graph_line'></div></div>")}var s=(n-r)/10+1;var o=$(".graph_points").height();var u=$(".graph_points").width();$(".count div.graph_numb").css("height",o/s);$.each(e,function(e,r){$(".graph_points").append("<div class='graph_point' style='margin-top:"+(n-r)/10*(o/s)+"px; margin-left:"+e*(u/t)+"px;'></div>")});(function(e){var t={createLine:function(e,t,n,r,i){var s=navigator.userAgent.indexOf("MSIE")>-1;if(n<e){var o=e;e=n;n=o;o=t;t=r;r=o}var u=document.createElement("div");u.setAttribute("id","line");var a=Math.sqrt((e-n)*(e-n)+(t-r)*(t-r));u.style.width=a+"px";u.style.borderBottom=i.stroke+"px solid";u.style.borderColor=i.color;u.style.position="absolute";u.style.zIndex=i.zindex;if(s){u.style.top=r>t?t+"px":r+"px";u.style.left=e+"px";var f=(n-e)/a;var l=(r-t)/a;u.style.filter="progid:DXImageTransform.Microsoft.Matrix(sizingMethod='auto expand', M11="+f+", M12="+ -1*l+", M21="+l+", M22="+f+")"}else{var c=Math.atan((r-t)/(n-e));u.style.top=t+.5*a*Math.sin(c)+"px";u.style.left=e-.5*a*(1-Math.cos(c))+"px";u.style.MozTransform=u.style.WebkitTransform=u.style.OTransform="rotate("+c+"rad)"}return u}};e.fn.line=function(n,r,i,s,o,u){return e(this).each(function(){if(e.isFunction(o)){callback=o;o=null}else{callback=u}o=e.extend({},e.fn.line.defaults,o);e(this).append(t.createLine(n,r,i,s,o)).promise().done(function(){if(e.isFunction(callback)){callback.call()}})})};e.fn.line.defaults={zindex:1e4,color:"#000000",stroke:"1"}})(jQuery);var a=$(".graph_point");for(i=0;i<a.length-1;i++){var f=parseInt($(a[i]).css("margin-top"),10);var l=parseInt($(a[i]).css("margin-left"),10);var c=parseInt($(a[i+1]).css("margin-top"),10);var h=parseInt($(a[i+1]).css("margin-left"),10);$(".graph_points").line(l+7,f+7,h+7,c+7,{color:"#454545",stroke:2,zindex:0},function(){$(this).addClass("line")})}}     
      
      if ($scope.fearScores.length > 0) {
        graph();
      }


      // De buttons toggle
      $scope.buttonTabsClick = function() {
        $(".resultSideTab").toggleClass("activeTab");
        $(".resultEnterTab").toggleClass("activeTab");
        $(".resultSide").toggleClass("activeTab");
        $(".resultEnter").toggleClass("activeTab");
      }

      $scope.ResultModal = {};
      $scope.ResultModalID = {};    
      $scope.ResultModalID.ID = ID -1;
      $scope.ResultModalData = {};

        //SLIDER + DRAW CIRCLE AND $scope.ResultModalData.fearscore
      function resultCircle(){var e=$("#circle");var t=$("#slider");var n=t.width()/2;var r=t.height()/2;var i=75;var s=0;var o=0,u=0;var a=false;$("#circle").touchstart(function(e){a=true;var t=$(".resultEnter .scroll").attr("style");var n=t.slice(0,-1)+" !important;";$(".resultEnter .scroll").removeAttr("style");$(".resultEnter .scroll").attr("style",n)}).touchend(function(e){a=false;var t=$(".resultEnter .scroll").attr("style");var n=t.slice(0,-11)+";";$(".resultEnter .scroll").removeAttr("style");$(".resultEnter .scroll").attr("style",n)}).touchmove(function(e){var f=$("#circle").offset();var l={x:f.left,y:f.top};if(a){var c=e.originalEvent.touches[0]||e.originalEvent.changedTouches[0];var h={x:c.pageX-l.x,y:c.pageY-l.y};var p=Math.atan2(h.x-i,h.y-i);s=-p/(Math.PI/5)+5;o=Math.round(i*Math.sin(s*Math.PI/5));u=Math.round(i*-Math.cos(s*Math.PI/5));t.css({left:o+i-n,top:u+i-r});t.css({WebkitTransform:"rotate("+s+"deg)"});t.css({"-moz-transform":"rotate("+s+"deg)"});$('input[name="range"]').val(Math.ceil(s*10));$("#test").html(Math.ceil(s)*10);$scope.ResultModalData.FearScore=Math.ceil(s)*10}});$("#circle").mousedown(function(e){a=true;var t=$(".resultEnter .scroll").attr("style");var n=t.slice(0,-1)+" !important;";$(".resultEnter .scroll").removeAttr("style");$(".resultEnter .scroll").attr("style",n)}).mouseup(function(e){a=false;var t=$(".resultEnter .scroll").attr("style");var n=t.slice(0,-11)+";";$(".resultEnter .scroll").removeAttr("style");$(".resultEnter .scroll").attr("style",n)}).mousemove(function(e){var f=$("#circle").offset();var l={x:f.left,y:f.top};if(a){var c={x:e.clientX-l.x,y:e.clientY-l.y};var h=Math.atan2(c.x-i,c.y-i);s=-h/(Math.PI/5)+5;o=Math.round(i*Math.sin(s*Math.PI/5));u=Math.round(i*-Math.cos(s*Math.PI/5));t.css({left:o+i-n,top:u+i-r});t.css({WebkitTransform:"rotate("+s+"deg)"});t.css({"-moz-transform":"rotate("+s+"deg)"});$('input[name="range"]').val(Math.ceil(s*10));$("#test").html(Math.ceil(s)*10);$scope.ResultModalData.fearScore=Math.ceil(s)*10}});var f=document.id("range");var l=document.id("counter");var c=c=l.getContext("2d");var h=null;var p=Math.PI*2;var d=Math.PI/2;c.beginPath();c.strokeStyle="#2F8C5F";c.lineCap="square";c.closePath();c.fill();c.lineWidth=5;h=c.getImageData(0,0,200,200);var v=function(e){c.putImageData(h,0,0);c.beginPath();c.arc(100,100,75,-d,p*e-d,false);c.stroke()};jQuery.fn.onPositionChanged=function(e,t){if(t==null)t=100;var n=$(this[0]);if(n.length<1)return n;var r=null;var i=null;setInterval(function(){if(n==null||n.length<1)return n;if(r==null)r=n.position();if(i==null)i=n.offset();var t=n.position();var s=n.offset();if(r.top!=t.top||r.left!=t.left){$(this).trigger("onPositionChanged",{lastPos:r,newPos:t});if(typeof e=="function")e(r,t);r=n.position()}if(i.top!=s.top||i.left!=s.left){$(this).trigger("onOffsetChanged",{lastOff:i,newOff:s});if(typeof e=="function")e(i,s);i=n.offset()}},t);return n};$("#slider").onPositionChanged(function(){v(f.value/100)})}setTimeout(function(){resultCircle()},500)      
      
      // Het schakelen tussen de ingevoerde kant naar de grafiek kant nadat er succesvol een oefening is ingevoerd
      $scope.ResultModalClose = function() {
        $(".resultSideTab").toggleClass("activeTab");
        $(".resultEnterTab").toggleClass("activeTab");
        $(".resultSide").toggleClass("activeTab");
        $(".resultEnter").toggleClass("activeTab");
        
        //RESETTING CIRCULAR SLIDER
        $("#slider").css({"left": "63.5px", "top": "-11.5px"});
        $("#test").html("");
        $('input[name="range"]').val(0);
        var range=document.id("range");var bg=document.id("counter");var ctx=ctx=bg.getContext("2d");var imd=null;var circ=Math.PI*2;var quart=Math.PI/2;ctx.beginPath();ctx.strokeStyle="#2F8C5F";ctx.lineCap="square";ctx.closePath();ctx.fill();ctx.lineWidth=5;imd=ctx.getImageData(0,0,200,200);var draw=function(e){ctx.putImageData(imd,0,0);ctx.beginPath();ctx.arc(100,100,75,-quart,circ*e-quart,false);ctx.stroke()};
        draw(range.value/100)   

      };

      // Invoer gegevens opslaan
      $scope.ResultModalSave = function() {
        
        // De overlay dat de data wordt opgeslagen
        
        // Hier wordt de de datum van het moment van invoeren gegenereerd
        Date.prototype.toDateInputValue = (function() {

            var local = new Date(this);
            local.setMinutes(this.getMinutes() - this.getTimezoneOffset());
            return local.toJSON().slice(0,10);

        });
        var dateAr = new Date().toDateInputValue().split('-');
        $scope.ResultModalData.Date = dateAr[2] + '-' + dateAr[1] + '-' + dateAr[0];

        // Klaarmaken om de ingevoerde data te posten
        $scope.ResultModalData.Exercise = $scope.ThisoefeningModal.ID;
        var $userLoggedInData = localStorage.getObject('user');
        var postUrl = 'http://backend-p6:8888/api/Message/';

        console.log($scope.fearScores);

        //De post
        if ($scope.ResultModalData.FearScore) {
          if ($scope.ResultModalData.Message) {
            delete $scope.error;
            
            $(".modal-wrapper .pane").append("<div class='waitOverlay'><span class='icon ion-loading-c'></span><span>BEZIG MET VERWERKEN...</span><div>")
            
            $http.post(postUrl, {FearScore: $scope.ResultModalData.FearScore, Message: $scope.ResultModalData.Message, Date: $scope.ResultModalData.Date, Exercise: $scope.ResultModalData.Exercise}, {headers: {'X-Silverstripe-Apitoken': $userLoggedInData.user_token }}).
              success(function(data, status, headers, config) {     

                var url = "http://backend-p6:8888/api/Patient/" + $userLoggedInData.user_id;
                var obj = {};

                // Hier wordt de written datum bepaald van de ingevoerde datum
                var date = $scope.ResultModalData.Date.split('-');
                var monthNames = ["januarie", "februari", "maart", "april", "mei", "juni", "juli", "augustus", "september", "oktober", "november", "december"];
                var monthValue = monthNames[date[1]-1];
                $scope.ResultModalData.WrittenDate = date[0] + ' ' + monthValue + ' ' + date[2];


                // Hier wordt gekeken of dit het eerste bericht is of niet. Dat weetende wordt de array van fearscores aangevult en data gepusht naar thisoefeningmodaldata
                if ($scope.ThisoefeningModal.Messages) {
                  $scope.ThisoefeningModal.Messages.push({FearScore: JSON.stringify($scope.ResultModalData.FearScore), Message: $scope.ResultModalData.Message, Date: $scope.ResultModalData.Date, WrittenDate: $scope.ResultModalData.WrittenDate, Exercise: $scope.ResultModalData.Exercise});
                  $scope.fearScores = JSON.parse($scope.fearScores);
                  var toPush = JSON.stringify($scope.ResultModalData.FearScore)
                  $scope.fearScores.push(toPush);
                  $scope.fearScores = JSON.stringify($scope.fearScores);
                } else {
                  $scope.ThisoefeningModal.Messages = {0:{FearScore: JSON.stringify($scope.ResultModalData.FearScore), Message: $scope.ResultModalData.Message, Date: $scope.ResultModalData.Date, WrittenDate: $scope.ResultModalData.WrittenDate, Exercise: $scope.ResultModalData.Exercise}};
                  $scope.fearScores = [];
                  var toPush = JSON.stringify($scope.ResultModalData.FearScore)
                  $scope.fearScores.push(toPush);
                  $scope.fearScores = JSON.stringify($scope.fearScores);
                }

                // Resetting graph
                $(".count").html("");
                $(".graph_points").html("");
                $(".graph_header").html("");


                // Nieuwe data ophalen en zetten in de local storage
                $http.get(url, {headers: {'X-Silverstripe-Apitoken': $userLoggedInData.user_token }}).success(function(data) {
                  obj.data = data;

                  localStorage.setObject('userdata', data);
                  $scope.oefeningen = data.Exercises;


                  // Aanmaken van de dataset van de geopende modal
                  for (var i=0; i<=$scope.oefeningen.length - 1; i++){
                      if ($scope.oefeningen[i].ID === ID ) {
                        $scope.ThisoefeningModal = $scope.oefeningen[i];
                      };
                  }
                  //  de thisoefeningmodal wordt hier aangepast
                  if ($scope.ThisoefeningModal.Messages) {
                    for (var i=0; i<=$scope.ThisoefeningModal.Messages.length - 1; i++){
                      var date = $scope.ThisoefeningModal.Messages[i].Date.split('-');

                      var monthNames = ["januarie", "februari", "maart", "april", "mei", "juni", "juli", "augustus", "september", "oktober", "november", "december"];
                      var monthValue = monthNames[date[1]-1];
                      //console.log(monthValue);
                      $scope.ThisoefeningModal.Messages[i].WrittenDate = date[0] + ' ' + monthValue + ' ' + date[2];

                    }
                  }

                  // Het sluiten van de resulaten modal en het openen van het andere tablat
                  $scope.ResultModalClose();
                  
                  // Plot het grafiek opnieuw
                  graph();

                  // Het leegmaken van de de resulaten sectie
                  delete $scope.ResultModalData.Message;
                  delete $scope.ResultModalData.fearScore;
                  $(".waitOverlay").remove();
                });
              }).

              error(function(data, status, headers, config) {
                console.log(data);

              });
          
          } else {$scope.error = {}; $scope.error.text = "U heeft geen aantekening ingevoerd"; $scope.error.class="form_error"};
        } else {$scope.error = {}; $scope.error.text = "U heeft geen angstscore ingevoerd"; $scope.error.class="form_error"};
      };

  };
}])