WebFont.load({
  typekit: { id: 'vcc4etr' },

  google: {
    families: ['PT Sans']
  },

  active: function() {
    $('.section-sections-item-products-main').trigger('update');
    $('.sibfil').trigger('update');
  }
});