/* eslint-disable camelcase */
const Products = require('../models/product');

const getProduct = async (req, res) => {
  try {
    // eslint-disable-next-line no-multi-spaces
    const { id_product  } = req.params;

    const data = await Products.findOne({
      where: { id_product },
    });

    res.status(200).json({
      message: 'Berhasil memuat data',
      data,
    });
  } catch (err) {
    res.status(500).json({
      message: err.message,
    });
  }
};

module.exports = getProduct;
