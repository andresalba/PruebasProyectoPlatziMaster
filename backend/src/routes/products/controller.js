/**Controller to manage store of products endpoint
 * @module routes/products/controller
 */
const { nanoid } = require('nanoid');

const TABLA = 'products';
const TABLA_ALBUMS = 'albums';
const TABLA_PHOTOS = 'product_photos';

function controller(injectedStore){
    let store = injectedStore;
    if (!store) {
        store = require('../../store/mysql');
    }
    /**
     * Logic to insert a Product into the store.
     * @param {Object} body - The Product information 
     * @returns {Promise<object[]>} res - result of Product insertion
     */
    async function insert(body) {
        const product = {
            description: body.description,
            product_title: body.title,
            cost: body.cost,
            quantity: body.quantity,
            creation_date: new Date(),
            id_seller: '123',
            available: 1,
            id_countries:'123',
            id_albums:'222',
            id_categories:body.id_categories,
            score: 0,
        }
        product.id_products = nanoid();

        const album = {
            id_albums: nanoid(), 
            id_products: product.id_products,
            description: body.title,
            created_date: new Date()
        }
        try{
            await store.insert(TABLA_ALBUMS, album);
        }catch(err){
            throw err;
        }
        
        if(body.photo){
            const photo = {
                id_product_photos: nanoid(),
                description: body.photo.description,
                url_photo: body.photo.url,
                id_albums: album.id_albums,
                created_date: new Date(),
                visible: true,
            }
            try{
                await store.insert(TABLA_PHOTOS, photo);
            }catch(err){
                throw err;
            }
        }
            return await store.insert(TABLA, product);
    }
    /**
     * Logic to update a product
     * @method PUT 
     * @param {Object} body - The Product information to be updated
     * @returns {Object} res - result of Product update operation
    */
    async function update(body) {
        /**
         * @const {Object} - object to insert into product table
         */
        const product = {
            description: body.description,
            product_title: body.title,
            cost: body.cost,
            quantity: body.quantity,
            id_seller: '123',
            available: body.available,
            id_countries:'123',
            id_categories:body.id_categories,
        }

        if(body.photo){
            /**
             * @const {Object} - object to insert into photo table
             */
            const photo = {
                description: body.photo.description,
                url_photo: body.photo.url,
                visible: body.photo.visible,
            }
            const queryUpdatePhoto = `UPDATE ${TABLA_PHOTOS} SET ? WHERE id_albums=(SELECT id_albums FROM ${TABLA_ALBUMS} WHERE albums.id_products='${body.id_products}')`;
            try{
                await store.update(queryUpdatePhoto, photo);
            }catch(err){
                throw err;
            }
        }

        const queryUpdateProductInfo = `UPDATE ${TABLA} SET ? WHERE id_products='${body.id_products}'`;
        return await store.update(queryUpdateProductInfo, product);
    }
    /**
     * Logic to list all Products of the store.
     * @returns {Promise<object[]>} res - List of Products
     */
    async function list(){
        return await store.list(TABLA);
    }
     /**
     * Logic to get one Product with a product ID target.
     * @param {string} id - The User ID target 
     * @returns {Promise<object[]>} res - result of one Product
     */
    async function get(id){
        const query = `SELECT * FROM ${TABLA} WHERE id_products='${id}'`;
        return await store.get(query);
    }
    /**
    * Logic to get all products that match with the word to search.
    * @param {string} searchWord - The word to search into the products
    * @returns {Promise<object[]>} res - Product list that match with the word to search.
    */
    async function getProductByName(searchWord){
        const query = `SELECT * FROM ${TABLA} WHERE product_title like'%${searchWord}%' or description like '%${searchWord}%'`;
        return await store.get(query);
    }
    /**
    * Logic to get all products that match with a price range.
    * @param {string} min_price - The min price
    * @param {string} max_price - The max price
    * @returns {Promise<object[]>} res - Product list that match with the word to search.
    */
    async function getProductByPrice(min_price, max_price){
        const query = `SELECT * FROM ${TABLA} WHERE cost >= ${min_price} and cost <= ${max_price}`;
        return await store.get(query);
    }
    /**
    * Logic to get all products that match with a category.
    * @param {string} cat_id - The category id
    * @returns {Promise<object[]>} res - Product list that match with the category id.
    */
    async function getProductsByCategory(cat_id){
        const query = `SELECT * FROM ${TABLA} WHERE id_categories='${cat_id}'`;
        return await store.get(query);
    }
    
    return {
        insert,
        update,
        list,
        get,
        getProductByName,
        getProductByPrice,
        getProductsByCategory,
    }
}

module.exports = controller;