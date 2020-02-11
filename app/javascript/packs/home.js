import InfiniteScroll from "infinite-scroll"
import "../styles/home.sass"

document.addEventListener("DOMContentLoaded", () => {
  new InfiniteScroll(".status__wrapper", {
    path: "nav.pagination a[rel=next]",
    append: ".status",
    history: false,
    prefill: true,
    hideNav: "nav.pagination"
  })
})