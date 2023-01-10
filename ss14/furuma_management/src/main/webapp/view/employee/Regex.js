function checkName(name) {
    let regName = /^[A-Z][a-z]*(\s[A-Z][a-z]*)+$/;
    let checkedName = regName.exec(name);
    if (!checkedName) {
        document.getElementById("errorName").innerText = "Tên chưa đúng định dạng"
        document.getElementById("btnSave").disabled = true;
    } else {
        document.getElementById("btnSave").disabled = false;
        document.getElementById("errorName").innerText = ""
    }
}
function checkIdCard(idCard) {
    let regId = /^(\d{9}|\d{12})$/
    if (!regId.exec(idCard)) {
        document.getElementById("errorId").innerText = "ID chưa đúng định dạng"
        document.getElementById("btnSave").disabled = true;
    } else {
        document.getElementById("errorId").innerText = ""
        document.getElementById("btnSave").disabled = false;
    }
}function checkPhone(phone) {
    let regPhone = /^(090\d{7}|091\d{7}|\(84\)\+91\d{7}|\(84\)\+90\d{7})$/
    if (!regPhone.exec(phone)) {
        document.getElementById("errorPhone").innerText = "Phone chưa đúng định dạng"
        document.getElementById("btnSave").disabled = true;
    } else {
        document.getElementById("errorPhone").innerText = ""
        document.getElementById("btnSave").disabled = false;
    }
}