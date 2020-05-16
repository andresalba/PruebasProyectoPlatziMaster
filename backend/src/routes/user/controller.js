const { nanoid } = require('nanoid');
const bcrypt = require('bcryptjs');

const TABLA = 'users';
const TABLA_USER_ADDRESS = 'addresess';

function controller(injectedStore){
    let store = injectedStore;
    if (!store) {
        store = require('../../store/mysql');
    }
    
    async function insert(body) {
        const user = {
            id_users: nanoid(),
            login: '',
            first_name: '',
            last_name: '',
            email: body.email,
            photo: '',
            id_security_levels: '',
            id_shopping_carts:'',
            creation_date: new Date(),
            id_user_types: '',
            score: 0,
            available: 1,
            password: await bcrypt.hash(body.password,5),
        }
        try{
            return await store.insert(TABLA, user);
        }catch(err){
            throw err;
        }
    }

    async function list(){
        return await store.list(TABLA);
    }

    async function get(id){
        const query = `SELECT * FROM ${TABLA} WHERE id_users='${id}'`;
        //return await store.get(TABLA, id);
        return await store.get(query);
    }

    async function getAddr(id){
        //SELECT * FROM addresess INNER JOIN user ON addresess.UserID = user.UserID
        //SELECT * FROM addresess WHERE UserID='auPaaWgpllgm6OAIjh7-d'
        const query = `SELECT * FROM ${TABLA_USER_ADDRESS} WHERE id_users='${id}'`;
        //return await store.get(TABLA, id);
        return await store.get(query);
    }

    return {
        insert,
        list,
        get,
        getAddr,
    }
}

module.exports = controller;