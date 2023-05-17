import { createStore } from "vuex";
const store = createStore({
    state: {
        cartItemCount: 0,
        cartItems: []
    },
    // plugins: [createPersistedState()],
    mutations: {
        addtoCart(state, payload) {
            let item = payload;
            item = { ...item, quantity: 1 }
            // kiểm tra điều kiện trong cartItems
            if (state.cartItems.length > 0) {
                // tạo ra biến bool là để so sánh id giữ item add vào và id trong cart
                let bool = state.cartItems.some(i => i.id == item.id)
                // Nếu trùng thì thêm vào số lượng + 1
                if (bool) {
                    let itemIndex = state.cartItems.findIndex(el => el.id === item.id)
                    if (state.cartItems[itemIndex]["quantity"] < 0) {
                        state.cartItems.splice(itemIndex, 1)
                    }
                    else {
                        state.cartItems[itemIndex]["quantity"] += 1
                    }

                }
                //Nếu không thì thêm phần tử mới 
                else {
                    state.cartItems.push(item)
                }
            }
            else {
                state.cartItems.push(item)

            }
            state.cartItemCount++
        },
        removeItem(state, payload) {
            if (state.cartItems.length > 0) {
                let index = state.cartItems.some(i => i.id == payload.id)
                if (state.cartItems[index]["quantity"] !== 0) {
                    state.cartItems[index]["quantity"] -= 1
                    state.cartItemCount--
                }
                if (state.cartItems[index]["quantity"] === 0) {
                    state.cartItems.splice(index, 1)
                }
            }
        }
    },
    actions: {
        addtoCart: (context, payload) => {
            context.commit("addtoCart", payload)
        },
        removeItem: (context, payload) => {

            context.commit("removeItem", payload)
        }
    }
});

export default defineNuxtPlugin((nuxtApp) => {
    nuxtApp.vueApp.use(store);
    // Install the store instance as a plugin

});