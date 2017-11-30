/**
 * 이미지 경로를 입력받아 해당 이미지를 base64로 인코딩
 */

// BLOB을 Binary로 다시 Binary를 Base64로
var converterEngine = function (input) { 
    var uInt8Array = new Uint8Array(input),
        i = uInt8Array.length;
    var biStr = []; //new Array(i);
    while (i--) {
        biStr[i] = String.fromCharCode(uInt8Array[i]);
    }
    var base64 = window.btoa(biStr.join(''));
    return base64;
};

var getImageBase64 = function (url, callback) {
    //해당 경로로 비동기 통신
    var xhr = new XMLHttpRequest(url);
    xhr.open('GET', url, true); 
    xhr.responseType = 'arraybuffer';
    xhr.callback = callback;
    xhr.onload = function (e) {
        if (this.status == 200) { // 2. When loaded, do:
            //console.log("1:Loaded response >>> " + this.response); // print-check xhr response 
            var imgBase64 = converterEngine(this.response); // convert BLOB to base64
            this.callback(imgBase64); //인코딩 Data 반환
        }
    };
    xhr.send();
};
