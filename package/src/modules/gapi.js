function init(w,d,s,g,js,fs){
    g=w.gapi||(w.gapi={});g.analytics={q:[],ready:function(f){this.q.push(f);}};
    js=d.createElement(s);fs=d.getElementsByTagName(s)[0];
    js.src='https://apis.google.com/js/platform.js';
    fs.parentNode.insertBefore(js,fs);js.onload=function(){g.load('analytics');};
}

export default function(window, document){
    let gapi = window.gapi
    const analytics = gapi && gapi.analytics

    if (!analytics){
        init(window, document, 'script')
        gapi = window.gapi
    }

    return gapi
}
