angular.module('starter.profilePageCtrl', ['dataservices'])

.controller('profileCtrl', ['$scope', 'dataService', 'localStorage', '$timeout', '$ionicModal', '$ionicSideMenuDelegate', '$state', '$compile', '$http', function($scope, dataService, localStorage, $timeout, $ionicModal, $ionicSideMenuDelegate, $state, $compile, $http){

  // Zorgt ervoor dat het menu niet open geslide kan worden op deze pagina
  $ionicSideMenuDelegate.canDragContent(false);

  // data object wordt weer gelijkgetrokken hier
  var data = localStorage.getObject('userdata');
  if (data) {

    $scope.data = data;
    //console.log($scope.data);

    //HIER MOET EEN ALGERITME VOOR VERZONNEN WORDEN --->MAU/RUBEN!
    $scope.data.currentLevel = "starter";

    //Settings button
    $scope.ownProfileSettingsToggle = function () {
      $(".activityShare").toggleClass("active");
    }

    if ($scope.data.Exercises) {
      //console.log(allExercises);
      //Alle opdrachten worden in een array gezet
      var allExercises = [];

      for (var i=0; i<=$scope.data.Exercises.length-1; i++){
        if ($scope.data.Exercises[i].Messages) {
          for (var j=0; j<=$scope.data.Exercises[i].Messages.length-1; j++){
            allExercises.push($scope.data.Exercises[i].Messages[j])
          }
        };
      }

      // Hier worden alle exercises op juiste volgorde gesorteerd (Natural sort)
      allExercises.sort(function (a, b) {
        if (a.ID > b.ID) {
          return 1;
        }
        if (a.ID < b.ID) {
          return -1;
        }
        return 0;
      });


      $scope.data.TotalExercises = allExercises.length;

      // Date tot week function
      Date.prototype.getWeek = function(){
          var d = new Date(+this);
          d.setHours(0,0,0);
          d.setDate(d.getDate()+4-(d.getDay()||7));
          return Math.ceil((((d-new Date(d.getFullYear(),0,1))/8.64e7)+1)/7);
      };

      //console.log(allExercises);
      // how much exercises done in one week
      var counts = {};
      var exercisesInWeek = {};
      for (var i = 0; i < allExercises.length; i++) {
        var date = allExercises[i].Date.split('-');

        var dateCalc = new Date(date[2],date[1]-1,date[0]);
        var weekno = dateCalc.getWeek();

        counts[weekno] = (counts[weekno])? counts[weekno] + 1 : 1 ;

        if (exercisesInWeek[weekno]) {
          exercisesInWeek[weekno].push(allExercises[i]);
        } else {
          exercisesInWeek[weekno] = [];
          exercisesInWeek[weekno].push(allExercises[i]);
        }
      };

      //console.log(exercisesInWeek);
      //console.log(counts);

      // Welke week zit in welke maand
      function weekNumbersRangeInMonth(month, year){

        year = year || new Date().getFullYear();
        var yearStart = new Date(year,0,1); // 1st Jan of the Year

        var first_day_of_month = new Date(year, month, 1);
        var first_week_number = Math.ceil(( ( (first_day_of_month - yearStart) / 86400000) +yearStart.getDay()+ 1)/7);

        var last_day_of_month = new Date(year, month+1, 0); // Last date of the Month
        var last_week_number = Math.ceil(( ( (last_day_of_month - yearStart) / 86400000) +yearStart.getDay()+ 1)/7);

        return  [first_week_number, last_week_number];
      }

      function daysRangeInWeekNumbers(weekNo){
          var d1 = new Date();

          var arr = [];

          numOfdaysPastSinceLastMonday = eval(d1.getDay()- 1);
          d1.setDate(d1.getDate() - numOfdaysPastSinceLastMonday);
          var weekNoToday = d1.getWeek();
          var weeksInTheFuture = eval( weekNo - weekNoToday );
          d1.setDate(d1.getDate() + eval( 7 * weeksInTheFuture ));

          var date =  eval(d1.getMonth()+1)   +"-"  +  d1.getDate()  + "-"  +   d1.getFullYear();
          var datesplit = date.split('-');
          var dateMatch = datesplit[1] + "-" + datesplit[0] + "-" + datesplit[2];
          arr.push(dateMatch);

          for (var i = 1; i < 7; i++) {
            d1.setDate(d1.getDate() + 1);   
            var date = eval(d1.getMonth()+1)   +"-"  +  d1.getDate()  + "-"  +   d1.getFullYear() ;
            var datesplit = date.split('-');
            var dateMatch = datesplit[1] + "-" + datesplit[0] + "-" + datesplit[2];
            arr.push(dateMatch);     
          };
          
          return arr;
      };

      // console.log(daysRangeInWeekNumbers(47));

      var monthNames = ["januarie", "februarie", "maart", "april", "mei", "juni", "juli", "augustus", "september", "oktober", "november", "december"];
      var monthWeeks = {};

      for (var i = 0; i < monthNames.length; i++) {
        var month_jan = i;  //Jan - Dec (0-11)
        var year_2014 = 2014;
        var week_no_arr = weekNumbersRangeInMonth(month_jan, year_2014);
        var arr = [];
        for(var index = week_no_arr[0]; index<=week_no_arr[1]; index++){
          arr.push(index);
        }
        monthWeeks[monthNames[i]] = arr;
      };

      var getCurrentDate = new Date();
      var getCurrentMonth = getCurrentDate.getMonth();

      //console.log(monthWeeks);

      $scope.choosenMonth = {};
      // $scope.choosenMonth.month = "oktober"; // <----------- HIER MOET EEN CLICK FUNTIE VAN WORDEN ALS DIT WORD VERANDERD IN ANDERE MAAND DAN VERANDERD DE GRAFIEK
      $scope.choosenMonth.month = monthNames[getCurrentMonth]; // <----------- HIER MOET EEN CLICK FUNTIE VAN WORDEN ALS DIT WORD VERANDERD IN ANDERE MAAND DAN VERANDERD DE GRAFIEK
      
      $scope.ThisMonth = function (month) {
        //console.log(month);
        $scope.choosenMonth.month = month;
        $(".barChartWeeks").html("");
        $(".barChartBars").html("");
        $(".barChartCount").html("");
        $scope.makeBarGraph();
        $(".ChooseMonth").removeClass("show");

        $(".ChooseMonthToggle").attr('ng-click','chooseMonth()');
        $compile($('.ChooseMonthToggle'))($scope);
      }

      $scope.chooseMonth = function () {
        $(".ChooseMonth").addClass("show");
      }

      $scope.makeBarGraph = function () {

        $scope.choosenMonth.monthWeeks = monthWeeks[$scope.choosenMonth.month];
        $scope.choosenMonth.weeklyExercises = {};
        $scope.choosenMonth.dalyExercise = {};

        // total exercises in weeks of one month
        var sumMonthWeeksCount = 0;

        for (var i = 0; i < $scope.choosenMonth.monthWeeks.length; i++) {
          $scope.choosenMonth.weeklyExercises[$scope.choosenMonth.monthWeeks[i]] = counts[$scope.choosenMonth.monthWeeks[i]];
          if (!$scope.choosenMonth.weeklyExercises[$scope.choosenMonth.monthWeeks[i]]) {
            $scope.choosenMonth.weeklyExercises[$scope.choosenMonth.monthWeeks[i]] = 0;
          };
          if (counts[$scope.choosenMonth.monthWeeks[i]]) {
            sumMonthWeeksCount += counts[$scope.choosenMonth.monthWeeks[i]];
          };

        };

        var ExercisesPerDay = {};
        var dateInWeekArr = daysRangeInWeekNumbers($scope.choosenMonth.monthWeeks[i]);
        
        for (var i = 0; i < $scope.choosenMonth.monthWeeks.length; i++) {
          var dateInWeekArr = daysRangeInWeekNumbers($scope.choosenMonth.monthWeeks[i]);
          ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]] = {};

          for (var k = 0; k < dateInWeekArr.length; k++) {
              var dateArr = dateInWeekArr[k];
              var dateArrSplit = dateArr.split("-");
              var dateHowIWantItInObject = dateArrSplit[2]+"-"+dateArrSplit[1]+"-"+dateArrSplit[0];
              var dateArrSplitted = new Date(dateArrSplit[2],dateArrSplit[1]-1,dateArrSplit[0]);

              for (var j = 0; j < allExercises.length; j++) {
                var date = allExercises[j].Date;
                var dateSplit = date.split("-");
                var dateSplitted = new Date(dateSplit[2],dateSplit[1]-1,dateSplit[0]);


                //console.log(dateArrSplitted +" "+ dateSplitted)

                if (JSON.stringify(dateArrSplitted) === JSON.stringify(dateSplitted)) {
                  //console.log("MATCH")
                  //console.log(dateArr);

                  if (ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]][dateHowIWantItInObject]) {
                    ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]][dateHowIWantItInObject] = ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]][dateHowIWantItInObject] +1;
                  } else {
                    ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]][dateHowIWantItInObject] = 1;
                  }
                } else {
                  //console.log("NOMATCH")
                  if (!ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]][dateHowIWantItInObject]) {
                    ExercisesPerDay[$scope.choosenMonth.monthWeeks[i]][dateHowIWantItInObject] = 0;
                  };
                }


              };
              
            };
        };

        $scope.choosenMonth.dalyExercise = ExercisesPerDay;

        // Calculate activity level
        $scope.choosenMonth.activityLevel = (sumMonthWeeksCount / $scope.choosenMonth.monthWeeks.length).toFixed(2);

        //console.log($scope.choosenMonth);

        // Preperations for barchart
        var arr = Object.keys( $scope.choosenMonth.weeklyExercises ).map(function ( key ) {
          return $scope.choosenMonth.weeklyExercises[key];
        });

        var min = 0;
        var max = Math.max.apply( null, arr );

        var widthOfBarChart = $(".barChart").width();
        var heightOfBarChart = $(".barChart").height();

        var sizeOneBar = 30;
        $scope.weekOrDay = "Week";

        for (var i = 0; i < arr.length; i++) {
          var heightOfThisBar = ((arr[i] / max) * heightOfBarChart);
          sColor = (10 - arr[i]) * 10 ;
          if (sColor === 0) {
            sColor = 10;
          }
          if (sColor < 0) {
            sColor = 10;
          }

          $(".barChartBars").append("<div class='s"+sColor+" barChartBar' ng-click='weeklyGraph("+$scope.choosenMonth.monthWeeks[i]+")' style='width:"+sizeOneBar+"px; height:"+(heightOfThisBar - 13)+"px;' ></div>")
          $(".barChartWeeks").append("<span style='width:"+sizeOneBar+"px;'>"+$scope.choosenMonth.monthWeeks[i]+"</span>");


        };

        $compile($('.barChartBar'))($scope);

        var heightOfCount = heightOfBarChart/max;
        for (i = max; i > 0; --i) {
              //console.log(i);
              $(".barChartCount").append("<div class='barChartCountLevel' style='height: "+heightOfCount+"px'>"+(i)+"<div class='barChartCountLine'></div></div>");
        }

      }

      $scope.makeBarGraph();

      // Geschreven datum omreken funcite
      function getWrittenDate(inputDate) {
        var date = inputDate.split('-');
        var monthValue = monthNames[date[1]-1];
        return date[0] + ' ' + monthValue + ' ' + date[2];
      }

      // Laatste 2 gedane oefening pakken
      $scope.latestExercise = [];
      if (allExercises.length > 0) {
        for (var i=0; i<=$scope.data.Exercises.length - 1; i++){
            if ($scope.data.Exercises[i].ID === allExercises[allExercises.length-1].Exercise ) {
              $scope.latestExercise.push($scope.data.Exercises[i]);
              var WrittenDate = getWrittenDate(allExercises[allExercises.length-1].Date);
              //console.log(WrittenDate);
              $scope.latestExercise[0].WrittenDate = WrittenDate;
            };
        }
        if (allExercises.length > 1) {
          for (var i=0; i<=$scope.data.Exercises.length - 1; i++){
              if ($scope.data.Exercises[i].ID === allExercises[allExercises.length-2].Exercise ) {
                $scope.latestExercise.push($scope.data.Exercises[i]);
                var WrittenDate = getWrittenDate(allExercises[allExercises.length-1].Date);
                //console.log(WrittenDate);
                $scope.latestExercise[1].WrittenDate = WrittenDate;
              };
          }
        }
      }

    };

    // Tab toggle
    $scope.buttonTabsClick = function() {
      $(".ownViewTab").toggleClass("activeTab");
      $(".groupViewTab").toggleClass("activeTab");
      $(".ownView").toggleClass("activeTab");
      $(".groupView").toggleClass("activeTab");
    }

    $scope.weeklyGraph = function(week) {

      var thisWeekData = $scope.choosenMonth.dalyExercise[week];
      var month = $scope.choosenMonth.month;

     // console.log(thisWeekData);
      $(".barChartWeeks").html("");
      $(".barChartBars").html("");
      $(".barChartCount").html("");

      // Preperations for barchart
        var arr = Object.keys( thisWeekData ).map(function ( key ) {
          return thisWeekData[key];
        });
        var keys = Object.keys(thisWeekData);
        //console.log(keys);


        var min = 0;
        var max = Math.max.apply( null, arr );

        var widthOfBarChart = $(".barChart").width();
        var heightOfBarChart = $(".barChart").height();

        var sizeOneBar = 32;

        $scope.weekOrDay = "Datum";
        $scope.choosenMonth.month = "week " + week;

        $(".ChooseMonthToggle").attr('ng-click','ThisMonth("'+month+'")');
        $compile($('.ChooseMonthToggle'))($scope);

        for (var i = 0; i < arr.length; i++) {
          var heightOfThisBar = ((arr[i] / max) * heightOfBarChart);
          sColor = (10 - arr[i]) * 10 ;
          if (sColor === 0) {
            sColor = 10;
          }
          if (sColor < 0) {
            sColor = 10;
          }

          var splittedKeys = keys[i].split("-");
          var dateToShow = splittedKeys[2] +"/"+ splittedKeys[1];

          $(".barChartBars").append("<div class='s"+sColor+" barChartBar' style='width:"+sizeOneBar+"px; height:"+(heightOfThisBar - 13)+"px;' ></div>")
          $(".barChartWeeks").append("<span style='width:"+sizeOneBar+"px;'>"+dateToShow+"</span>");


        };

        $compile($('.barChartBar'))($scope);

        var heightOfCount = heightOfBarChart/max;
        for (i = max; i > 0; --i) {
              //console.log(i);
              $(".barChartCount").append("<div class='barChartCountLevel' style='height: "+heightOfCount+"px'>"+(i)+"<div class='barChartCountLine'></div></div>");
        }

    }


  }
}])