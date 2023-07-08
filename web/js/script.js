function triggerModal() {
    const myModalEl = document.getElementById("productModel");
    const modal = new mdb.Modal(myModalEl);
    modal.toggle();
}

function myFunction() {
    alert("KAKAKA");
}


function validatePhone(input) {
    // Remove non-digit characters
    var value = input.value.replace(/\D/g, '');

    // Limit the length to 10 characters
    if (value.length > 10) {
        value = value.slice(0, 10);
    }

    // Update the input value
    input.value = value;
}

function validateName(input) {
    var value = input.value;
    var regex = /^[A-Za-z\s]+$/;

    if (!regex.test(value)) {
        document.getElementById('error-fullName').textContent = "Tên của bạn không được có số và ký tự đặc biệt";
        document.getElementById('error-fullName').style.display = "block";
        checkFullName = true;
    } else {
        document.getElementById('error-fullName').textContent = "";
        document.getElementById('error-fullName').style.display = "none";
        checkFullName = false;
    }
}