
function resetInput() {
//  document.getElementById("TenTB").value = "";
//  document.getElementById("HinhAnh").value = "";
//  document.getElementById("GiaTB").value = "";
//  document.getElementById("SoLuong").value = "";
//  document.getElementById("MaTB").value = "";
//  document.getElementById("MoTa").value = "";
}


const Show_Add = () => {
  const btnADD = document.querySelector(".content__header--btnADD");
  const addNew = document.querySelector(".add_new");
  const overlay = document.querySelector(".add_overlay");
  const btnCancel = document.querySelector(".btn--cancel");

  
  resetInput();

   btnADD.onclick = () => {
    addNew.classList.toggle("displayFlex");
  };
  
  overlay.onclick = () => {
    addNew.classList.toggle("displayFlex");
  };
  
  btnCancel.onclick = () => {
    addNew.classList.toggle("displayFlex");
  };

}

function valueInput() {
  const inputAddSelect = document.querySelectorAll(".inputAdd");
  const valueNull = document.querySelectorAll(".value__null");

  inputAddSelect.forEach((element, index) => {
    if (element.value === "") {
      console.log(element);
      valueNull.forEach((option, key) => {
        if (index == key) {
          console.log(option);
          option.innerText = `Vui lòng nhập thông tin`;
        }
      });
    } else {
      valueNull.forEach((option, key) => {
        if (index == key) {
          option.innerText = ``;
        }
      });
    }
  });
}


function add_new() {
  valueInput();
  
  

  const valueNull = document.querySelectorAll(".value__null");

  let arrValueNull = [];

  valueNull.forEach((element) => {
    arrValueNull.push(element.innerText);
  });

//  let checkValueNull = arrValueNull.every((value) => value === "");
  
  
    console.log(arrValueNull);

  if (arrValueNull.length === 0) {

  document.getElementById("formAdd").action="add";
  document.getElementById("formAdd").method="post"

}
  else {

//    alert("Please fulfill the required conditions before submitting.");

  }
}

//const Show_Edit = () => {
//  const btnADD = document.querySelector(".icon__option--pen");
//  const addNew = document.querySelector(".edit");
//  const overlay = document.querySelector(".edit_overlay");
//  const btnCancel = document.querySelector(".edit_btn--cancel");
//
//  
//  resetInput();
//
//   btnADD.onclick = () => {
//    addNew.classList.toggle("displayFlex");
//  };
//  
//  overlay.onclick = () => {
//    addNew.classList.toggle("displayFlex");
//  };
//  
//  btnCancel.onclick = () => {
//    addNew.classList.toggle("displayFlex");
//  };
//
//}

const Loading = () => {
  Show_Add();
//  Show_Edit();
}
