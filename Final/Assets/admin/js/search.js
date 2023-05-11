$(document).ready(function () {
    $("#charSearch").on('input', function () {
        $.ajax({
            url: '/Home/UsLogin',
            type: 'post',
            
            success: function (data) {
                console.log(data)
                
            }
        })
    })
    
});