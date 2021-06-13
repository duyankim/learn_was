const toggleArrow = (icon) => {
    const menus = document.querySelectorAll(".menus");
    const menusStr = ["menu1", "menu2", "menu3"];

    if (icon.classList.contains("arrowOpen")) {
        icon.classList.remove("arrowOpen");
        for (let i = 0; i < menus.length; i++) {
            if (icon.id == menusStr[i]) {
                menus[i].classList.add("menuDisplayNone");
            }
        }
    } else {
        icon.classList.add("arrowOpen");
        for (let i = 0; i < menus.length; i++) {
            if (icon.id == menusStr[i]) {
                menus[i].classList.remove("menuDisplayNone");
            }
        }
    }
}