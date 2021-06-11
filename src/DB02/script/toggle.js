const toggleArrow = (icon) => {
    if (icon.classList.contains("arrowOpen")) {
        icon.classList.remove("arrowOpen");
    } else {
        icon.classList.add("arrowOpen");
    }
}