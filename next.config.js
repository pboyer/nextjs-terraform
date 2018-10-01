const withTypescript = require('@zeit/next-typescript')
const m = withTypescript();

m.exportPathMap = function (defaultPathMap) {
    return {
        '/': { page: '/' },
        '/about': { page: '/about' }
    }
};

module.exports = m;