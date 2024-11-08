async function getVisitorCount() {
    try {
        const response = await fetch('https://lzcxn23mkf.execute-api.us-east-1.amazonaws.com/prod/visitor_counter');
        const data = await response.json();
        document.getElementById('visitor-counter').innerText = data.visitor_counter;  // Update the HTML element with the visitor count
    } catch (error) {
        console.error("Error fetching visitor count:", error);
    }
}
window.onload = getVisitorCount;
