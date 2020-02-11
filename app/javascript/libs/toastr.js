import toastr from "toastr"

window.toastr = window.toastr || toastr
toastr.options = {
  closeButton: true,
  progressBar: true,
  positionClass: "toast-bottom-left",
}