document.querySelector('button').addEventListener('click', function() {
    var value = document.querySelector('input').value;
    if (value) {
        addItemTodo(value);
        done();
    }
}
);
var form = document.querySelector('form'); 
        form.addEventListener('submit', (e)=>{
              e.preventDefault();
        });
function addItemTodo(text) {
    var list = document.querySelector('ul');
    var item = document.createElement('li');
    item.innerText = text;
    list.appendChild(item);
  
}

function done(){
    document.querySelector('li').addEventListener("click",()=>{
        console.log('completed');
        alert('completed succefully');
    })
}


    