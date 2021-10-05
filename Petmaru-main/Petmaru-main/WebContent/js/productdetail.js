/**
 * 
 */
window.onload = function() {
    document.getElementById('review_sec').style.display = 'none';
    document.getElementById('reviewBtn').onclick = reviewView;

    function reviewView() {
        document.getElementById('review_sec').style.display = 'block';
    }
}