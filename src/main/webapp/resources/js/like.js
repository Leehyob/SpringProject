var boardService = (function(){
   
    function addlike(like, successCallback, errorCallback) {
        console.log("add like..............." + JSON.stringify(like));
        $.ajax({
            type: "post",
            url: "/board/addlike",
            data: JSON.stringify(like),
            contentType: "application/json; charset=utf-8",
            success: function(result, status, xhr) {
                if (successCallback) {
                    successCallback(result);
                }
            },
            error: function(xhr, status, er) {
                if (errorCallback) {
                    errorCallback(er);
                }
            }
        });
    }
    
  function removelike(like, callback, errorCallback) {
    console.log("remove like..............." + JSON.stringify(like));
    $.ajax({
        type: "post",
        url: "/board/removelike",
        contentType: "application/json; charset=utf-8",
        data: JSON.stringify(like),
        success: function(result, status, xhr) {
            if (callback) {
                callback(result);
            }
        },
        error: function(xhr, status, er) {
            if (errorCallback) {
                errorCallback(er);
            }
        }
    });
}

    return {
        addlike : addlike,
        removelike : removelike,
    };
})();