import axios from 'axios';
import Vue from 'vue/dist/vue.esm';


document.addEventListener('turbolinks:load', function(event) {
  let el = document.querySelector('.subscribe');
	if (el) {
  new Vue({
    el,
    data() {
        return{

        }
    },
    
    methods: {
        addSubscribe(event) {
        event.preventDefault();
        let user = event.currentTarget.dataset.user
        let icon = document.querySelector('i.subscribe');
        // /users/:id/subscribe
        axios.post(`/api/users/${user}/subscribe`)
          .then((response) => {
          let status = response.data.status
        //   console.log(status)
          switch (status) {
			case 'sign_in_first':
				alert('你必須先登入')
				break
			case 'subscribe':
                icon.classList.add('far')
                icon.classList.remove('fas')
				break
			case 'subscribed':
                icon.classList.add('fas')
                icon.classList.remove('far')
				break
			}
          })
          .catch((error) =>{
          console.log(error)
          })
        }
    }
  })
  }
})
