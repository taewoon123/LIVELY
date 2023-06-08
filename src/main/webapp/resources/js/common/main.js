navigator.geolocation.getCurrentPosition(onGeoSuccess, onGeoError);

function onGeoSuccess(position) {
    let latitude = position.coords.latitude;
    let longitude = position.coords.longitude;
        //naver Map
        let map = new naver.maps.Map('map', {
            center: new naver.maps.LatLng(latitude, longitude),
            mapTypeControl: false, //맵 일반,위성,지형 선택하는 드랍다운 
            mapTypeControlOptions: {
                style: naver.maps.MapTypeControlStyle.DROPDOWN
            //위의 mapTypeControl true로 활성화 해야 가능
            },
            zoom: 20 //맵 로딩시 기본 배율
        });

        let trafficLayer = new naver.maps.TrafficLayer({
            interval: 300000 // 5분마다 새로고침 (최소값 5분)
        });

        let btn = $('#traffic');

        naver.maps.Event.addListener(map, 'trafficLayer_changed', function(trafficLayer) {
            if (trafficLayer) {
                btn.addClass('control-on');
                $("#autorefresh").parent().show();
                $("#autorefresh")[0].checked = true;
            } else {
                btn.removeClass('control-on');
                $("#autorefresh").parent().hide();
            }
        });

        btn.on("click", function(e) {
            e.preventDefault();

            if (trafficLayer.getMap()) {
                trafficLayer.setMap(null);
            } else {
                trafficLayer.setMap(map);
            }
        });

        $("#autorefresh").on("click", function(e) {
            let btn = $(this),
                checked = btn.is(":checked");

            if (checked) {
                trafficLayer.startAutoRefresh();
            } else {
                trafficLayer.endAutoRefresh();
            }
        });

        naver.maps.Event.once(map, 'init', function() {
            trafficLayer.setMap(map);
        });
        }

function onGeoError(){
  alert("Error occurred while getting your location ! please close the page and try again");
}




