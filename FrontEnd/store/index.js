import Vuex from 'vuex'
const createStore = () => {
    return new Vuex.Store({
        state: {
            products:[]
        },
        mutations: {},
        actions: {},
        getters: {}

    })
}
export default createStore