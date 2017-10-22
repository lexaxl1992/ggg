var infoblock;
function bind_fadeIn() {
   infoBlock = new Vue({
      el: '#about',
      data: {},
      methods: {
         onScroll: function(e, position) {
            //this.classList.remove('null_opacity')
            console.log(position)
         }
      }
   })
}