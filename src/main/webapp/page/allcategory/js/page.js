"use strict";
var _typeof = "function" == typeof Symbol && "symbol" == typeof Symbol.iterator ?
function(t) {
	return typeof t
} : function(t) {
	return t && "function" == typeof Symbol && t.constructor === Symbol && t !== Symbol.prototype ? "symbol" : typeof t
};
function initApp(o, t) { 
	var r = null,
		e = {
			configCart: function() {
				var n = this;
				n.shoppingCart = n.config.shoppingCart, n.cartEventHandler = n.cartEventHandler.bind(n), n.movesc = o(n.config.movesc), n.movescbox = o(n.config.movescbox), n.cartContainer = o(n.config.cartContainer, n.viewContainer), n.cartMiniView = o(n.config.cartMiniView, n.viewContainer), n.cartQty = o(".yb-cart-qty", n.cartMiniView), n.cartAmount = o(".yb-cart-money", n.cartMiniView), n.viewContainer.on("click", ".yb-cart-operate", function(t) {
					t.stopPropagation(), t.preventDefault();
					var e = o(this),
						i = e.data("uid");
					if (e.data("isseries")) location.href = " #/details/" + i;
					else if (i) {
						var a = e.data("price"),
							s = o(t.target);
						s.hasClass("yb-cart-add") ? _yb.services.products.checkAttr(i, function(t) {
							"1" === t ? _yb.views.selectAttr.open(i) : (o.toast("鍔犲叆璐墿杞?", 500), n.shoppingCart.add(i, "", a, [], !1))
						}) : s.hasClass("yb-item-plus") ? n.shoppingCart.add(i, "", a, [], !0) : s.hasClass("yb-item-minus") ? n.shoppingCart.minus(i) : s.hasClass("yb-cart-remove_home") && _yb.services.products.checkAttr(i, function(t) {
							"1" != t ? n.shoppingCart.minus(i) : o.confirm({
								title: "鎻愮ず",
								text: "鏄惁鍒拌喘鐗╄溅鎿嶄綔",
								onOK: function() {
									window.location.hash = "#/cart"
								},
								onCancel: function() {}
							})
						})
					}
				}), n.viewContainer.on("change", ".qval", function(t, e) {
					var i = o(this),
						a = parseFloat(i.val(), 10);
					if (0 <= a && ($c = i.parent(".yb-cart-operate"), e = $c.data("uid"))) {
						var s = $c.attr("p_price");
						n.shoppingCart.update(e, a, "", s)
					}
				}), o(n.config.orderLink, n.viewContainer).on("click", function(t) {
					return t.stopPropagation(), t.preventDefault(), 0 == n.shoppingCart.find().length ? o.alert("褰撳墠璐墿杞︿负绌猴紒") : (o.showLoading("鏁版嵁鍔犺浇涓?"), n.shoppingCart.syncCart(function() {
						setTimeout(function() {
							o.hideLoading()
						}, 2e3), window.location = n.config.orderPageUrl
					})), !1
				})
			},
			animateAddingCart: function(t, e) {
				null !== r && clearTimeout(r);
				var i = t.offset(),
					a = this.cartMiniView.offset(),
					s = this.movesc,
					n = this.movescbox,
					o = this.cartContainer;
				s.css("left", i.left + "px"), n.css("top", i.top + "px").addClass("do"), r = setTimeout(function() {
					s.css("left", a.left + 5 + "px"), n.css("top", a.top + 18 + "px"), r = setTimeout(function() {
						n.removeClass("do"), o.removeClass("yb-cart-empty").addClass("yb-cart-has"), e && e(), r = null
					}, 610)
				}, 5)
			},
			cartEventHandler: function(t, e, i) {
				switch (e) {
				case "reload":
					this.updateAllItems();
					break;
				case "add":
				case "minus":
				case "update":
					this.updateItem(i)
				}
				this.updateSummary(t.summary())
			},
			updateSummary: function(t) {
				(0 == this.cartContainer.length || this.cartMiniView && 0 == this.cartMiniView.length) && (this.cartContainer = o(this.config.cartContainer, this.viewContainer), this.cartMiniView = o(this.config.cartMiniView, this.viewContainer), this.cartQty = o(".yb-cart-qty", this.cartMiniView), this.cartAmount = o(".yb-cart-money", this.cartMiniView)), this.cartQty.text(t.quantity), this.cartAmount.text(_yb.ft_c(t.amount)), 0 == t.quantity ? this.cartContainer.removeClass("yb-cart-has").addClass("yb-cart-empty") : this.cartContainer.removeClass("yb-cart-empty").addClass("yb-cart-has")
			},
			updateItem: function(t, e) {
				var i;
				(console.log("shoppingCartFns"), 1 == e) ? 0 < (i = o("[p_uid='" + t.PackageId + "']", this.viewContainer)).length && (o("input.yb-item-qty", i).val(t.PackageNum), t.PackageTotalNum ? (o("input.yb-item-qtys", i).val(t.PackageTotalNum), t.PackageNum > t.PackageTotalNum && o("input.yb-item-qtys", i).val(t.PackageNum)) : o("input.yb-item-qtys", i).val(t.PackageNum), 0 < t.PackageNum ? i.removeClass("yb-item-empty").addClass("yb-item-has") : i.removeClass("yb-item-has").addClass("yb-item-empty")) : 0 < (i = o("[p_uid='" + t.ProductId + "']", this.viewContainer)).length && (o("input.yb-item-qty", i).val(t.ProductNum), t.ProductTotalNum ? (o("input.yb-item-qtys", i).val(t.ProductTotalNum), t.ProductNum > t.ProductTotalNum && o("input.yb-item-qtys", i).val(t.ProductNum)) : o("input.yb-item-qtys", i).val(t.ProductNum), 0 < t.ProductNum ? i.removeClass("yb-item-empty").addClass("yb-item-has") : i.removeClass("yb-item-has").addClass("yb-item-empty"))
			},
			updateAllItems: function() {
				console.log("shoppingCartFns");
				var t = this.shoppingCart.find();
				0 == t.length && t && (o(".yb-item", ".yb-shopping").removeClass("yb-item-has"), o(".yb-item", "#categoriesView").removeClass("yb-item-has"));
				for (var e = 0; e < t.length; e++) {
					var i = t[e];
					null != i[0].PackageSerial ? this.updateItem(i[0], !0) : this.updateItem(i[0])
				}
			}
		};
	_yb.mixins.ShoppingCartFns = e
}