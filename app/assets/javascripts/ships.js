function ship(name, size, max_cargo, max_distance) {
  this.name = name;
  this.size = size;
  this.max_cargo = max_cargo;
  this.max_distance = max_distance;
};

function showShip(ship){

}

$(document).ready(function() {
  attachListeners();
});

function attachListeners() {
//  $("input[value='commit']").on('click', () => showShip(ship));
    $("input[value='Create Ship']").on('click', function () {
      $("newship").text("It's Working!");
    }
}

function balls() {
  alert('Loading')
}
