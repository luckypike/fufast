# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_10_02_173555) do

  create_table "b_abtest", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", null: false
    t.string "ACTIVE", limit: 1, default: "N", null: false
    t.string "ENABLED", limit: 1, default: "N", null: false
    t.string "NAME"
    t.text "DESCR"
    t.text "TEST_DATA", null: false
    t.datetime "START_DATE"
    t.datetime "STOP_DATE"
    t.integer "DURATION", default: 0, null: false
    t.integer "PORTION", default: 0, null: false
    t.integer "MIN_AMOUNT"
    t.integer "USER_ID"
    t.integer "SORT", default: 100, null: false
  end

  create_table "b_admin_notify", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50
    t.string "TAG"
    t.text "MESSAGE"
    t.string "ENABLE_CLOSE", limit: 1, default: "Y"
    t.string "PUBLIC_SECTION", limit: 1, default: "N", null: false
    t.string "NOTIFY_TYPE", limit: 1, default: "M", null: false
    t.index ["TAG"], name: "IX_AD_TAG"
  end

  create_table "b_admin_notify_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "NOTIFY_ID", null: false
    t.string "LID", limit: 2, null: false
    t.text "MESSAGE"
    t.index ["LID"], name: "IX_ADM_NTFY_LID"
    t.index ["NOTIFY_ID", "LID"], name: "IX_ADM_NTFY_LANG", unique: true
  end

  create_table "b_agent", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50
    t.integer "SORT", default: 100, null: false
    t.text "NAME"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "LAST_EXEC"
    t.datetime "NEXT_EXEC", null: false
    t.datetime "DATE_CHECK"
    t.integer "AGENT_INTERVAL", default: 86400
    t.string "IS_PERIOD", limit: 1, default: "Y"
    t.integer "USER_ID"
    t.string "RUNNING", limit: 1, default: "N", null: false
    t.index ["ACTIVE", "NEXT_EXEC"], name: "ix_act_next_exec"
    t.index ["USER_ID"], name: "ix_agent_user_id"
  end

  create_table "b_app_password", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "APPLICATION_ID", null: false
    t.string "PASSWORD", null: false
    t.string "DIGEST_PASSWORD", null: false
    t.datetime "DATE_CREATE"
    t.datetime "DATE_LOGIN"
    t.string "LAST_IP"
    t.string "COMMENT"
    t.string "SYSCOMMENT"
    t.string "CODE"
    t.index ["USER_ID"], name: "ix_app_password_user"
  end

  create_table "b_b24connector_buttons", primary_key: "ID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "APP_ID", null: false
    t.datetime "ADD_DATE", null: false
    t.integer "ADD_BY", null: false
    t.string "NAME"
    t.text "SCRIPT"
  end

  create_table "b_bitrixcloud_option", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 50, null: false
    t.integer "SORT", null: false
    t.string "PARAM_KEY", limit: 50
    t.string "PARAM_VALUE", limit: 200
    t.index ["NAME"], name: "ix_b_bitrixcloud_option_1"
  end

  create_table "b_blog", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.text "DESCRIPTION"
    t.datetime "DATE_CREATE", null: false
    t.datetime "DATE_UPDATE", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "OWNER_ID"
    t.integer "SOCNET_GROUP_ID"
    t.string "URL", null: false
    t.string "REAL_URL"
    t.integer "GROUP_ID", null: false
    t.string "ENABLE_COMMENTS", limit: 1, default: "Y", null: false
    t.string "ENABLE_IMG_VERIF", limit: 1, default: "N", null: false
    t.string "ENABLE_RSS", limit: 1, default: "Y", null: false
    t.integer "LAST_POST_ID"
    t.datetime "LAST_POST_DATE"
    t.string "AUTO_GROUPS"
    t.string "EMAIL_NOTIFY", limit: 1, default: "Y", null: false
    t.string "ALLOW_HTML", limit: 1, default: "N", null: false
    t.string "SEARCH_INDEX", limit: 1, default: "Y", null: false
    t.string "USE_SOCNET", limit: 1, default: "N", null: false
    t.index ["GROUP_ID", "ACTIVE"], name: "IX_BLOG_BLOG_1"
    t.index ["LAST_POST_DATE"], name: "IX_BLOG_BLOG_5"
    t.index ["OWNER_ID"], name: "IX_BLOG_BLOG_2"
    t.index ["SOCNET_GROUP_ID"], name: "IX_BLOG_BLOG_6"
    t.index ["URL"], name: "IX_BLOG_BLOG_4", unique: true
  end

  create_table "b_blog_category", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BLOG_ID", null: false
    t.string "NAME", null: false
    t.index ["BLOG_ID", "NAME"], name: "IX_BLOG_CAT_1", unique: true
  end

  create_table "b_blog_comment", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BLOG_ID", null: false
    t.integer "POST_ID", null: false
    t.integer "PARENT_ID"
    t.integer "AUTHOR_ID"
    t.integer "ICON_ID"
    t.string "AUTHOR_NAME"
    t.string "AUTHOR_EMAIL"
    t.string "AUTHOR_IP", limit: 20
    t.string "AUTHOR_IP1", limit: 20
    t.datetime "DATE_CREATE", null: false
    t.string "TITLE"
    t.text "POST_TEXT", null: false
    t.string "PUBLISH_STATUS", limit: 1, default: "P", null: false
    t.string "HAS_PROPS", limit: 1
    t.string "SHARE_DEST"
    t.string "PATH"
    t.index ["AUTHOR_ID"], name: "IX_BLOG_COMM_2"
    t.index ["BLOG_ID", "POST_ID"], name: "IX_BLOG_COMM_1"
    t.index ["DATE_CREATE", "AUTHOR_ID"], name: "IX_BLOG_COMM_3"
  end

  create_table "b_blog_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.index ["SITE_ID"], name: "IX_BLOG_GROUP_1"
  end

  create_table "b_blog_image", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FILE_ID", default: 0, null: false
    t.integer "BLOG_ID", default: 0, null: false
    t.integer "POST_ID", default: 0, null: false
    t.integer "USER_ID", default: 0, null: false
    t.datetime "TIMESTAMP_X", null: false
    t.string "TITLE"
    t.integer "IMAGE_SIZE", default: 0, null: false
    t.string "IS_COMMENT", limit: 1, default: "N", null: false
    t.integer "COMMENT_ID"
    t.index ["POST_ID", "BLOG_ID"], name: "IX_BLOG_IMAGE_1"
  end

  create_table "b_blog_post", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TITLE", null: false
    t.integer "BLOG_ID", null: false
    t.integer "AUTHOR_ID", null: false
    t.text "PREVIEW_TEXT"
    t.string "PREVIEW_TEXT_TYPE", limit: 4, default: "text", null: false
    t.text "DETAIL_TEXT", null: false
    t.string "DETAIL_TEXT_TYPE", limit: 4, default: "text", null: false
    t.datetime "DATE_CREATE", null: false
    t.datetime "DATE_PUBLISH", null: false
    t.string "KEYWORDS"
    t.string "PUBLISH_STATUS", limit: 1, default: "P", null: false
    t.string "CATEGORY_ID", limit: 100
    t.string "ATRIBUTE"
    t.string "ENABLE_TRACKBACK", limit: 1, default: "Y", null: false
    t.string "ENABLE_COMMENTS", limit: 1, default: "Y", null: false
    t.integer "ATTACH_IMG"
    t.integer "NUM_COMMENTS", default: 0, null: false
    t.integer "NUM_TRACKBACKS", default: 0, null: false
    t.integer "VIEWS"
    t.integer "FAVORITE_SORT"
    t.string "PATH"
    t.string "CODE"
    t.string "MICRO", limit: 1, default: "N", null: false
    t.string "HAS_IMAGES", limit: 1
    t.string "HAS_PROPS", limit: 1
    t.string "HAS_TAGS", limit: 1
    t.string "HAS_COMMENT_IMAGES", limit: 1
    t.string "HAS_SOCNET_ALL", limit: 1
    t.string "SEO_TITLE"
    t.string "SEO_TAGS"
    t.text "SEO_DESCRIPTION"
    t.index ["BLOG_ID", "CATEGORY_ID"], name: "IX_BLOG_POST_3"
    t.index ["BLOG_ID", "CODE"], name: "IX_BLOG_POST_CODE"
    t.index ["BLOG_ID", "DATE_PUBLISH", "PUBLISH_STATUS"], name: "IX_BLOG_POST_2"
    t.index ["BLOG_ID", "PUBLISH_STATUS", "DATE_PUBLISH"], name: "IX_BLOG_POST_1"
    t.index ["CODE"], name: "IX_BLOG_POST_6"
    t.index ["DATE_PUBLISH", "AUTHOR_ID"], name: "IX_BLOG_POST_5"
    t.index ["PUBLISH_STATUS", "DATE_PUBLISH"], name: "IX_BLOG_POST_4"
  end

  create_table "b_blog_post_category", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BLOG_ID", null: false
    t.integer "POST_ID", null: false
    t.integer "CATEGORY_ID", null: false
    t.index ["CATEGORY_ID"], name: "IX_BLOG_POST_CATEGORY_CAT_ID"
    t.index ["POST_ID", "CATEGORY_ID"], name: "IX_BLOG_POST_CATEGORY", unique: true
  end

  create_table "b_blog_post_param", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POST_ID"
    t.integer "USER_ID"
    t.string "NAME", limit: 50, null: false
    t.string "VALUE", null: false
    t.index ["POST_ID", "USER_ID"], name: "IX_BLOG_PP_1"
    t.index ["USER_ID"], name: "IX_BLOG_PP_2"
  end

  create_table "b_blog_site_path", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.string "PATH", null: false
    t.string "TYPE", limit: 1
    t.index ["SITE_ID", "TYPE"], name: "IX_BLOG_SITE_PATH_2", unique: true
  end

  create_table "b_blog_smile", primary_key: "ID", id: :integer, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SMILE_TYPE", limit: 1, default: "S", null: false
    t.string "TYPING", limit: 100
    t.string "IMAGE", limit: 128, null: false
    t.string "DESCRIPTION", limit: 50
    t.string "CLICKABLE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 150, null: false
    t.integer "IMAGE_WIDTH", default: 0, null: false
    t.integer "IMAGE_HEIGHT", default: 0, null: false
  end

  create_table "b_blog_smile_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SMILE_ID", default: 0, null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", null: false
    t.index ["SMILE_ID", "LID"], name: "IX_BLOG_SMILE_K", unique: true
  end

  create_table "b_blog_socnet", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BLOG_ID", null: false
    t.index ["BLOG_ID"], name: "IX_BLOG_SOCNET", unique: true
  end

  create_table "b_blog_socnet_rights", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POST_ID", null: false
    t.string "ENTITY_TYPE", limit: 45, null: false
    t.integer "ENTITY_ID", null: false
    t.string "ENTITY", limit: 45, null: false
    t.index ["POST_ID"], name: "IX_BLOG_SR_1"
  end

  create_table "b_blog_trackback", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TITLE", null: false
    t.string "URL", null: false
    t.text "PREVIEW_TEXT", null: false
    t.string "BLOG_NAME"
    t.datetime "POST_DATE", null: false
    t.integer "BLOG_ID", null: false
    t.integer "POST_ID", null: false
    t.index ["BLOG_ID", "POST_ID"], name: "IX_BLOG_TRBK_1"
    t.index ["POST_ID"], name: "IX_BLOG_TRBK_2"
  end

  create_table "b_blog_user", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "ALIAS"
    t.text "DESCRIPTION"
    t.integer "AVATAR"
    t.string "INTERESTS"
    t.datetime "LAST_VISIT"
    t.datetime "DATE_REG", null: false
    t.string "ALLOW_POST", limit: 1, default: "Y", null: false
    t.index ["ALIAS"], name: "IX_BLOG_USER_2"
    t.index ["USER_ID"], name: "IX_BLOG_USER_1", unique: true
  end

  create_table "b_blog_user2blog", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "BLOG_ID", null: false
    t.index ["BLOG_ID", "USER_ID"], name: "IX_BLOG_USER2GROUP_1", unique: true
  end

  create_table "b_blog_user2user_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "BLOG_ID", null: false
    t.integer "USER_GROUP_ID", null: false
    t.index ["USER_ID", "BLOG_ID", "USER_GROUP_ID"], name: "IX_BLOG_USER2GROUP_1", unique: true
  end

  create_table "b_blog_user_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BLOG_ID"
    t.string "NAME", null: false
    t.index ["BLOG_ID"], name: "IX_BLOG_USER_GROUP_1"
  end

  create_table "b_blog_user_group_perms", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BLOG_ID", null: false
    t.integer "USER_GROUP_ID", null: false
    t.string "PERMS_TYPE", limit: 1, default: "P", null: false
    t.integer "POST_ID"
    t.string "PERMS", limit: 1, default: "D", null: false
    t.string "AUTOSET", limit: 1, default: "N", null: false
    t.index ["BLOG_ID", "USER_GROUP_ID", "PERMS_TYPE", "POST_ID"], name: "IX_BLOG_UG_PERMS_1", unique: true
    t.index ["POST_ID", "USER_GROUP_ID", "PERMS_TYPE"], name: "IX_BLOG_UG_PERMS_3"
    t.index ["USER_GROUP_ID", "PERMS_TYPE", "POST_ID"], name: "IX_BLOG_UG_PERMS_2"
  end

  create_table "b_cache_tag", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2
    t.string "CACHE_SALT", limit: 4
    t.string "RELATIVE_PATH"
    t.string "TAG", limit: 100
    t.index ["SITE_ID", "CACHE_SALT", "RELATIVE_PATH"], name: "ix_b_cache_tag_0", length: { RELATIVE_PATH: 50 }
    t.index ["TAG"], name: "ix_b_cache_tag_1"
  end

  create_table "b_captcha", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ID", limit: 32, null: false
    t.string "CODE", limit: 20, null: false
    t.string "IP", limit: 15, null: false
    t.datetime "DATE_CREATE", null: false
    t.index ["ID"], name: "UX_B_CAPTCHA", unique: true
  end

  create_table "b_catalog_contractor", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "PERSON_TYPE", limit: 1, null: false
    t.string "PERSON_NAME", limit: 100
    t.string "PERSON_LASTNAME", limit: 100
    t.string "PERSON_MIDDLENAME", limit: 100
    t.string "EMAIL", limit: 100
    t.string "PHONE", limit: 45
    t.string "POST_INDEX", limit: 45
    t.string "COUNTRY", limit: 45
    t.string "CITY", limit: 45
    t.string "COMPANY", limit: 145
    t.string "INN", limit: 145
    t.string "KPP", limit: 145
    t.string "ADDRESS"
    t.timestamp "DATE_MODIFY", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "MODIFIED_BY"
  end

  create_table "b_catalog_currency", primary_key: "CURRENCY", id: :string, limit: 3, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "AMOUNT_CNT", default: 1, null: false
    t.decimal "AMOUNT", precision: 18, scale: 4
    t.integer "SORT", default: 100, null: false
    t.datetime "DATE_UPDATE", null: false
    t.string "NUMCODE", limit: 3
    t.string "BASE", limit: 1, default: "N", null: false
    t.integer "CREATED_BY"
    t.datetime "DATE_CREATE"
    t.integer "MODIFIED_BY"
    t.decimal "CURRENT_BASE_RATE", precision: 26, scale: 12
  end

  create_table "b_catalog_currency_lang", primary_key: ["CURRENCY", "LID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CURRENCY", limit: 3, null: false
    t.string "LID", limit: 2, null: false
    t.string "FORMAT_STRING", limit: 50, null: false
    t.string "FULL_NAME", limit: 50
    t.string "DEC_POINT", limit: 5, default: "."
    t.string "THOUSANDS_SEP", limit: 5, default: " "
    t.integer "DECIMALS", limit: 1, default: 2, null: false
    t.string "THOUSANDS_VARIANT", limit: 1
    t.string "HIDE_ZERO", limit: 1, default: "N", null: false
    t.integer "CREATED_BY"
    t.datetime "DATE_CREATE"
    t.integer "MODIFIED_BY"
    t.datetime "TIMESTAMP_X"
  end

  create_table "b_catalog_currency_rate", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CURRENCY", limit: 3, null: false
    t.date "DATE_RATE", null: false
    t.integer "RATE_CNT", default: 1, null: false
    t.decimal "RATE", precision: 18, scale: 4, default: "0.0", null: false
    t.integer "CREATED_BY"
    t.datetime "DATE_CREATE"
    t.integer "MODIFIED_BY"
    t.datetime "TIMESTAMP_X"
    t.string "BASE_CURRENCY", limit: 3
    t.index ["CURRENCY", "DATE_RATE"], name: "IX_CURRENCY_RATE", unique: true
  end

  create_table "b_catalog_disc_save_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "GROUP_ID", null: false
    t.index ["DISCOUNT_ID"], name: "IX_CAT_DSG_DISCOUNT"
    t.index ["GROUP_ID"], name: "IX_CAT_DSG_GROUP"
  end

  create_table "b_catalog_disc_save_range", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.float "RANGE_FROM", limit: 53, null: false
    t.string "TYPE", limit: 1, default: "P", null: false
    t.float "VALUE", limit: 53, null: false
    t.index ["DISCOUNT_ID", "RANGE_FROM"], name: "IX_CAT_DSR_DISCOUNT2"
    t.index ["DISCOUNT_ID"], name: "IX_CAT_DSR_DISCOUNT"
  end

  create_table "b_catalog_disc_save_user", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "USER_ID", null: false
    t.datetime "ACTIVE_FROM", null: false
    t.datetime "ACTIVE_TO", null: false
    t.float "RANGE_FROM", limit: 53, null: false
    t.index ["DISCOUNT_ID", "USER_ID"], name: "IX_CAT_DSU_USER"
    t.index ["DISCOUNT_ID"], name: "IX_CAT_DSU_DISCOUNT"
  end

  create_table "b_catalog_discount", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "XML_ID"
    t.string "SITE_ID", limit: 2, null: false
    t.integer "TYPE", default: 0, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "ACTIVE_FROM"
    t.datetime "ACTIVE_TO"
    t.string "RENEWAL", limit: 1, default: "N", null: false
    t.string "NAME"
    t.integer "MAX_USES", default: 0, null: false
    t.integer "COUNT_USES", default: 0, null: false
    t.string "COUPON", limit: 20
    t.integer "SORT", default: 100, null: false
    t.decimal "MAX_DISCOUNT", precision: 18, scale: 4
    t.string "VALUE_TYPE", limit: 1, default: "P", null: false
    t.decimal "VALUE", precision: 18, scale: 4, default: "0.0", null: false
    t.string "CURRENCY", limit: 3, null: false
    t.decimal "MIN_ORDER_SUM", precision: 18, scale: 4, default: "0.0"
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "COUNT_PERIOD", limit: 1, default: "U", null: false
    t.integer "COUNT_SIZE", default: 0, null: false
    t.string "COUNT_TYPE", limit: 1, default: "Y", null: false
    t.datetime "COUNT_FROM"
    t.datetime "COUNT_TO"
    t.integer "ACTION_SIZE", default: 0, null: false
    t.string "ACTION_TYPE", limit: 1, default: "Y", null: false
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "PRIORITY", default: 1, null: false
    t.string "LAST_DISCOUNT", limit: 1, default: "Y", null: false
    t.integer "VERSION", default: 1, null: false
    t.string "NOTES"
    t.text "CONDITIONS"
    t.text "UNPACK"
    t.index ["ACTIVE", "ACTIVE_FROM", "ACTIVE_TO"], name: "IX_C_D_ACT"
    t.index ["COUPON"], name: "IX_C_D_COUPON"
    t.index ["SITE_ID", "RENEWAL", "ACTIVE", "ACTIVE_FROM", "ACTIVE_TO"], name: "IX_C_D_ACT_B"
  end

  create_table "b_catalog_discount2cat", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "CATALOG_GROUP_ID", null: false
    t.index ["CATALOG_GROUP_ID", "DISCOUNT_ID"], name: "IX_C_D2C_CATDIS", unique: true
    t.index ["DISCOUNT_ID", "CATALOG_GROUP_ID"], name: "IX_C_D2C_CATDIS_B", unique: true
  end

  create_table "b_catalog_discount2group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "GROUP_ID", null: false
    t.index ["DISCOUNT_ID", "GROUP_ID"], name: "IX_C_D2G_GRDIS_B", unique: true
    t.index ["GROUP_ID", "DISCOUNT_ID"], name: "IX_C_D2G_GRDIS", unique: true
  end

  create_table "b_catalog_discount2iblock", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "IBLOCK_ID", null: false
    t.index ["DISCOUNT_ID", "IBLOCK_ID"], name: "IX_C_D2I_IBDIS_B", unique: true
    t.index ["IBLOCK_ID", "DISCOUNT_ID"], name: "IX_C_D2I_IBDIS", unique: true
  end

  create_table "b_catalog_discount2product", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "PRODUCT_ID", null: false
    t.index ["DISCOUNT_ID", "PRODUCT_ID"], name: "IX_C_D2P_PRODIS_B", unique: true
    t.index ["PRODUCT_ID", "DISCOUNT_ID"], name: "IX_C_D2P_PRODIS", unique: true
  end

  create_table "b_catalog_discount2section", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.integer "SECTION_ID", null: false
    t.index ["DISCOUNT_ID", "SECTION_ID"], name: "IX_C_D2S_SECDIS_B", unique: true
    t.index ["SECTION_ID", "DISCOUNT_ID"], name: "IX_C_D2S_SECDIS", unique: true
  end

  create_table "b_catalog_discount_cond", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "ACTIVE", limit: 1
    t.integer "USER_GROUP_ID", default: -1, null: false
    t.integer "PRICE_TYPE_ID", default: -1, null: false
  end

  create_table "b_catalog_discount_coupon", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "COUPON", limit: 32, null: false
    t.datetime "DATE_APPLY"
    t.string "ONE_TIME", limit: 1, default: "Y", null: false
    t.datetime "TIMESTAMP_X"
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.text "DESCRIPTION"
    t.index ["COUPON", "ACTIVE"], name: "ix_cat_dc_index2"
    t.index ["DISCOUNT_ID", "COUPON"], name: "ix_cat_dc_index1", unique: true
  end

  create_table "b_catalog_discount_module", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.index ["DISCOUNT_ID"], name: "IX_CAT_DSC_MOD"
  end

  create_table "b_catalog_docs_barcode", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DOC_ELEMENT_ID", null: false
    t.string "BARCODE", limit: 100, null: false
    t.index ["DOC_ELEMENT_ID"], name: "IX_B_CATALOG_DOCS_BARCODE1"
  end

  create_table "b_catalog_docs_element", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DOC_ID", null: false
    t.integer "STORE_FROM"
    t.integer "STORE_TO"
    t.integer "ELEMENT_ID"
    t.float "AMOUNT", limit: 53
    t.float "PURCHASING_PRICE", limit: 53
    t.index ["DOC_ID"], name: "IX_B_CATALOG_DOCS_ELEMENT1"
  end

  create_table "b_catalog_export", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "FILE_NAME", limit: 100, null: false
    t.string "NAME", limit: 250, null: false
    t.string "DEFAULT_PROFILE", limit: 1, default: "N", null: false
    t.string "IN_MENU", limit: 1, default: "N", null: false
    t.string "IN_AGENT", limit: 1, default: "N", null: false
    t.string "IN_CRON", limit: 1, default: "N", null: false
    t.text "SETUP_VARS"
    t.datetime "LAST_USE"
    t.string "IS_EXPORT", limit: 1, default: "Y", null: false
    t.string "NEED_EDIT", limit: 1, default: "N", null: false
    t.datetime "TIMESTAMP_X"
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.index ["FILE_NAME"], name: "BCAT_EX_FILE_NAME"
    t.index ["IS_EXPORT"], name: "IX_CAT_IS_EXPORT"
  end

  create_table "b_catalog_extra", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 50, null: false
    t.decimal "PERCENTAGE", precision: 18, scale: 2, null: false
  end

  create_table "b_catalog_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100, null: false
    t.string "BASE", limit: 1, default: "N", null: false
    t.integer "SORT", default: 100, null: false
    t.string "XML_ID"
    t.datetime "TIMESTAMP_X"
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
  end

  create_table "b_catalog_group2group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CATALOG_GROUP_ID", null: false
    t.integer "GROUP_ID", null: false
    t.string "BUY", limit: 1, default: "Y", null: false
    t.index ["CATALOG_GROUP_ID", "GROUP_ID", "BUY"], name: "IX_CATG2G_UNI", unique: true
  end

  create_table "b_catalog_group_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CATALOG_GROUP_ID", null: false
    t.string "LANG", limit: 2, null: false
    t.string "NAME", limit: 100
    t.index ["CATALOG_GROUP_ID", "LANG"], name: "IX_CATALOG_GROUP_ID", unique: true
  end

  create_table "b_catalog_iblock", primary_key: "IBLOCK_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "YANDEX_EXPORT", limit: 1, default: "N", null: false
    t.string "SUBSCRIPTION", limit: 1, default: "N", null: false
    t.integer "VAT_ID", default: 0
    t.integer "PRODUCT_IBLOCK_ID", default: 0, null: false
    t.integer "SKU_PROPERTY_ID", default: 0, null: false
    t.index ["PRODUCT_IBLOCK_ID"], name: "IXS_CAT_IB_PRODUCT"
    t.index ["SKU_PROPERTY_ID"], name: "IXS_CAT_IB_SKU_PROP"
  end

  create_table "b_catalog_load", primary_key: ["NAME", "TYPE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 250, null: false
    t.text "VALUE", null: false
    t.string "TYPE", limit: 1, default: "I", null: false
    t.string "LAST_USED", limit: 1, default: "N", null: false
  end

  create_table "b_catalog_measure", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CODE", null: false
    t.string "MEASURE_TITLE", limit: 500
    t.string "SYMBOL_RUS", limit: 20
    t.string "SYMBOL_INTL", limit: 20
    t.string "SYMBOL_LETTER_INTL", limit: 20
    t.string "IS_DEFAULT", limit: 1, default: "N", null: false
    t.index ["CODE"], name: "IX_B_CATALOG_MEASURE1", unique: true
  end

  create_table "b_catalog_measure_ratio", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_ID", null: false
    t.float "RATIO", limit: 53, default: 1.0, null: false
    t.index ["PRODUCT_ID", "RATIO"], name: "IX_B_CATALOG_MEASURE_RATIO", unique: true
  end

  create_table "b_catalog_price", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_ID", null: false
    t.integer "EXTRA_ID"
    t.integer "CATALOG_GROUP_ID", null: false
    t.decimal "PRICE", precision: 18, scale: 2, null: false
    t.string "CURRENCY", limit: 3, null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "QUANTITY_FROM"
    t.integer "QUANTITY_TO"
    t.string "TMP_ID", limit: 40
    t.index ["CATALOG_GROUP_ID"], name: "IXS_CAT_PRICE_GID"
    t.index ["PRODUCT_ID", "CATALOG_GROUP_ID"], name: "IXS_CAT_PRICE_PID"
  end

  create_table "b_catalog_product", primary_key: "ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "QUANTITY", limit: 53, null: false
    t.string "QUANTITY_TRACE", limit: 1, default: "N", null: false
    t.float "WEIGHT", limit: 53, default: 0.0, null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "PRICE_TYPE", limit: 1, default: "S", null: false
    t.integer "RECUR_SCHEME_LENGTH"
    t.string "RECUR_SCHEME_TYPE", limit: 1, default: "D", null: false
    t.integer "TRIAL_PRICE_ID"
    t.string "WITHOUT_ORDER", limit: 1, default: "N", null: false
    t.string "SELECT_BEST_PRICE", limit: 1, default: "Y", null: false
    t.integer "VAT_ID", default: 0
    t.string "VAT_INCLUDED", limit: 1, default: "Y"
    t.string "CAN_BUY_ZERO", limit: 1, default: "N", null: false
    t.string "NEGATIVE_AMOUNT_TRACE", limit: 1, default: "D", null: false
    t.string "TMP_ID", limit: 40
    t.decimal "PURCHASING_PRICE", precision: 18, scale: 2
    t.string "PURCHASING_CURRENCY", limit: 3
    t.string "BARCODE_MULTI", limit: 1, default: "N", null: false
    t.float "QUANTITY_RESERVED", limit: 53, default: 0.0
    t.string "SUBSCRIBE", limit: 1
    t.float "WIDTH", limit: 53
    t.float "LENGTH", limit: 53
    t.float "HEIGHT", limit: 53
    t.integer "MEASURE"
    t.integer "TYPE"
  end

  create_table "b_catalog_product2group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_ID", null: false
    t.integer "GROUP_ID", null: false
    t.integer "ACCESS_LENGTH", null: false
    t.string "ACCESS_LENGTH_TYPE", limit: 1, default: "D", null: false
    t.index ["PRODUCT_ID", "GROUP_ID"], name: "IX_C_P2G_PROD_GROUP", unique: true
  end

  create_table "b_catalog_product_sets", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "TYPE", null: false
    t.integer "SET_ID", null: false
    t.string "ACTIVE", limit: 1, null: false
    t.integer "OWNER_ID", null: false
    t.integer "ITEM_ID", null: false
    t.float "QUANTITY", limit: 53
    t.integer "MEASURE"
    t.float "DISCOUNT_PERCENT", limit: 53
    t.integer "SORT", default: 100, null: false
    t.integer "CREATED_BY"
    t.datetime "DATE_CREATE"
    t.integer "MODIFIED_BY"
    t.datetime "TIMESTAMP_X"
    t.string "XML_ID"
    t.index ["ITEM_ID"], name: "IX_CAT_PR_SET_ITEM_ID"
    t.index ["OWNER_ID"], name: "IX_CAT_PR_SET_OWNER_ID"
    t.index ["SET_ID"], name: "IX_CAT_PR_SET_SET_ID"
    t.index ["TYPE"], name: "IX_CAT_PR_SET_TYPE"
  end

  create_table "b_catalog_store", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TITLE", limit: 75
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "ADDRESS", limit: 245, null: false
    t.text "DESCRIPTION"
    t.string "GPS_N", limit: 15, default: "0"
    t.string "GPS_S", limit: 15, default: "0"
    t.string "IMAGE_ID", limit: 45
    t.integer "LOCATION_ID"
    t.timestamp "DATE_MODIFY", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "DATE_CREATE"
    t.integer "USER_ID"
    t.integer "MODIFIED_BY"
    t.string "PHONE", limit: 45
    t.string "SCHEDULE"
    t.string "XML_ID", limit: 45
    t.integer "SORT", default: 100, null: false
    t.string "EMAIL"
    t.string "ISSUING_CENTER", limit: 1, default: "Y", null: false
    t.string "SHIPPING_CENTER", limit: 1, default: "Y", null: false
    t.string "SITE_ID", limit: 2
  end

  create_table "b_catalog_store_barcode", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_ID", null: false
    t.string "BARCODE", limit: 100
    t.integer "STORE_ID"
    t.integer "ORDER_ID"
    t.datetime "DATE_MODIFY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "MODIFIED_BY"
    t.index ["BARCODE"], name: "IX_B_CATALOG_STORE_BARCODE1", unique: true
  end

  create_table "b_catalog_store_docs", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "DOC_TYPE", limit: 1, null: false
    t.string "SITE_ID", limit: 2
    t.integer "CONTRACTOR_ID"
    t.datetime "DATE_MODIFY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "MODIFIED_BY"
    t.string "CURRENCY", limit: 3
    t.string "STATUS", limit: 1, default: "N", null: false
    t.datetime "DATE_STATUS"
    t.datetime "DATE_DOCUMENT"
    t.integer "STATUS_BY"
    t.float "TOTAL", limit: 53
    t.string "COMMENTARY", limit: 1000
  end

  create_table "b_catalog_store_product", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_ID", null: false
    t.float "AMOUNT", limit: 53, default: 0.0, null: false
    t.integer "STORE_ID", null: false
    t.index ["PRODUCT_ID", "STORE_ID"], name: "IX_CATALOG_STORE_PRODUCT2", unique: true
    t.index ["STORE_ID"], name: "IX_CATALOG_STORE_PRODUCT1"
  end

  create_table "b_catalog_vat", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "C_SORT", default: 100, null: false
    t.string "NAME", limit: 50, default: "", null: false
    t.decimal "RATE", precision: 18, scale: 2, default: "0.0", null: false
    t.index ["ACTIVE"], name: "IX_CAT_VAT_ACTIVE"
  end

  create_table "b_catalog_viewed_product", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FUSER_ID", null: false
    t.datetime "DATE_VISIT", null: false
    t.integer "PRODUCT_ID", null: false
    t.integer "ELEMENT_ID", default: 0, null: false
    t.string "SITE_ID", limit: 2, null: false
    t.integer "VIEW_COUNT", default: 1, null: false
    t.string "RECOMMENDATION", limit: 40
    t.index ["FUSER_ID"], name: "IX_CAT_V_PR_FUSER_ID"
  end

  create_table "b_checklist", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "DATE_CREATE"
    t.string "TESTER"
    t.string "COMPANY_NAME"
    t.integer "PICTURE"
    t.integer "TOTAL"
    t.integer "SUCCESS"
    t.integer "FAILED"
    t.integer "PENDING"
    t.integer "SKIP"
    t.text "STATE", size: :long
    t.text "REPORT_COMMENT"
    t.string "REPORT", limit: 1, default: "Y"
    t.string "EMAIL", limit: 50
    t.string "PHONE", limit: 50
    t.string "SENDED_TO_BITRIX", limit: 1, default: "N"
    t.string "HIDDEN", limit: 1, default: "N"
  end

  create_table "b_clouds_file_bucket", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, default: "Y"
    t.integer "SORT", default: 500
    t.string "READ_ONLY", limit: 1, default: "N"
    t.string "SERVICE_ID", limit: 50
    t.string "BUCKET", limit: 63
    t.string "LOCATION", limit: 50
    t.string "CNAME", limit: 100
    t.integer "FILE_COUNT", default: 0
    t.float "FILE_SIZE", default: 0.0
    t.integer "LAST_FILE_ID"
    t.string "PREFIX", limit: 100
    t.text "SETTINGS"
    t.text "FILE_RULES"
  end

  create_table "b_clouds_file_resize", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "ERROR_CODE", limit: 1, default: "0", null: false
    t.integer "FILE_ID"
    t.text "PARAMS"
    t.string "FROM_PATH", limit: 500
    t.string "TO_PATH", limit: 500
    t.index ["FILE_ID"], name: "ix_b_file_resize_file"
    t.index ["TIMESTAMP_X"], name: "ix_b_file_resize_ts"
    t.index ["TO_PATH"], name: "ix_b_file_resize_path", length: 100
  end

  create_table "b_clouds_file_upload", primary_key: "ID", id: :string, limit: 32, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "FILE_PATH", limit: 500, null: false
    t.string "TMP_FILE", limit: 500
    t.integer "BUCKET_ID", null: false
    t.integer "PART_SIZE", null: false
    t.integer "PART_NO", null: false
    t.integer "PART_FAIL_COUNTER", null: false
    t.text "NEXT_STEP"
    t.integer "FILE_SIZE"
  end

  create_table "b_component_params", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.string "COMPONENT_NAME", null: false
    t.string "TEMPLATE_NAME"
    t.string "REAL_PATH", null: false
    t.string "SEF_MODE", limit: 1, default: "Y", null: false
    t.string "SEF_FOLDER"
    t.integer "START_CHAR", null: false
    t.integer "END_CHAR", null: false
    t.text "PARAMETERS"
    t.index ["COMPONENT_NAME"], name: "ix_comp_params_name"
    t.index ["SITE_ID", "COMPONENT_NAME"], name: "ix_comp_params_sname"
    t.index ["SITE_ID", "REAL_PATH"], name: "ix_comp_params_path"
  end

  create_table "b_counter_data", primary_key: "ID", id: :string, limit: 16, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TYPE", limit: 30, null: false
    t.text "DATA", null: false
  end

  create_table "b_culture", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE"
    t.string "NAME"
    t.string "FORMAT_DATE"
    t.string "FORMAT_DATETIME"
    t.string "FORMAT_NAME"
    t.integer "WEEK_START", default: 1
    t.string "CHARSET"
    t.string "DIRECTION", limit: 1, default: "Y"
  end

  create_table "b_event", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "EVENT_NAME", null: false
    t.integer "MESSAGE_ID"
    t.string "LID", null: false
    t.text "C_FIELDS", size: :long
    t.datetime "DATE_INSERT"
    t.datetime "DATE_EXEC"
    t.string "SUCCESS_EXEC", limit: 1, default: "N", null: false
    t.string "DUPLICATE", limit: 1, default: "Y", null: false
    t.string "LANGUAGE_ID", limit: 2
    t.index ["DATE_EXEC"], name: "ix_b_event_date_exec"
    t.index ["SUCCESS_EXEC"], name: "ix_success"
  end

  create_table "b_event_attachment", primary_key: ["EVENT_ID", "FILE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "EVENT_ID", null: false
    t.integer "FILE_ID", null: false
    t.string "IS_FILE_COPIED", limit: 1, default: "Y", null: false
  end

  create_table "b_event_log", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "SEVERITY", limit: 50, null: false
    t.string "AUDIT_TYPE_ID", limit: 50, null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.string "ITEM_ID", null: false
    t.string "REMOTE_ADDR", limit: 40
    t.text "USER_AGENT"
    t.text "REQUEST_URI"
    t.string "SITE_ID", limit: 2
    t.integer "USER_ID"
    t.integer "GUEST_ID"
    t.text "DESCRIPTION", size: :medium
    t.index ["TIMESTAMP_X"], name: "ix_b_event_log_time"
  end

  create_table "b_event_message", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "EVENT_NAME", null: false
    t.string "LID", limit: 2
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "EMAIL_FROM", default: "#EMAIL_FROM#", null: false
    t.string "EMAIL_TO", default: "#EMAIL_TO#", null: false
    t.string "SUBJECT"
    t.text "MESSAGE", size: :long
    t.text "MESSAGE_PHP", size: :long
    t.string "BODY_TYPE", limit: 4, default: "text", null: false
    t.text "BCC"
    t.string "REPLY_TO"
    t.string "CC"
    t.string "IN_REPLY_TO"
    t.string "PRIORITY", limit: 50
    t.string "FIELD1_NAME", limit: 50
    t.string "FIELD1_VALUE"
    t.string "FIELD2_NAME", limit: 50
    t.string "FIELD2_VALUE"
    t.string "SITE_TEMPLATE_ID"
    t.text "ADDITIONAL_FIELD"
    t.string "LANGUAGE_ID", limit: 2
    t.index ["EVENT_NAME"], name: "ix_b_event_message_name", length: 50
  end

  create_table "b_event_message_attachment", primary_key: ["EVENT_MESSAGE_ID", "FILE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "EVENT_MESSAGE_ID", null: false
    t.integer "FILE_ID", null: false
  end

  create_table "b_event_message_site", primary_key: ["EVENT_MESSAGE_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "EVENT_MESSAGE_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
  end

  create_table "b_event_type", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2, null: false
    t.string "EVENT_NAME", null: false
    t.string "NAME", limit: 100
    t.text "DESCRIPTION"
    t.integer "SORT", default: 150, null: false
    t.index ["EVENT_NAME", "LID"], name: "ux_1", unique: true
  end

  create_table "b_favorite", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TIMESTAMP_X"
    t.datetime "DATE_CREATE"
    t.integer "C_SORT", default: 100, null: false
    t.integer "MODIFIED_BY"
    t.integer "CREATED_BY"
    t.string "MODULE_ID", limit: 50
    t.string "NAME"
    t.text "URL"
    t.text "COMMENTS"
    t.string "LANGUAGE_ID", limit: 2
    t.integer "USER_ID"
    t.integer "CODE_ID"
    t.string "COMMON", limit: 1, default: "Y", null: false
    t.string "MENU_ID"
  end

  create_table "b_file", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "MODULE_ID", limit: 50
    t.integer "HEIGHT"
    t.integer "WIDTH"
    t.bigint "FILE_SIZE"
    t.string "CONTENT_TYPE", default: "IMAGE"
    t.string "SUBDIR"
    t.string "FILE_NAME", null: false
    t.string "ORIGINAL_NAME"
    t.string "DESCRIPTION"
    t.string "HANDLER_ID", limit: 50
    t.string "EXTERNAL_ID", limit: 50
    t.index ["EXTERNAL_ID"], name: "IX_B_FILE_EXTERNAL_ID"
  end

  create_table "b_file_search", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SESS_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "F_PATH"
    t.integer "B_DIR", default: 0, null: false
    t.integer "F_SIZE", default: 0, null: false
    t.integer "F_TIME", default: 0, null: false
  end

  create_table "b_filters", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID"
    t.string "FILTER_ID", null: false
    t.string "NAME", null: false
    t.text "FIELDS", null: false
    t.string "COMMON", limit: 1
    t.string "PRESET", limit: 1
    t.string "LANGUAGE_ID", limit: 2
    t.string "PRESET_ID"
    t.integer "SORT"
    t.string "SORT_FIELD"
  end

  create_table "b_finder_dest", primary_key: ["USER_ID", "CODE", "CONTEXT"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "CODE", limit: 30, null: false
    t.integer "CODE_USER_ID"
    t.string "CODE_TYPE", limit: 10
    t.string "CONTEXT", limit: 50, null: false
    t.datetime "LAST_USE_DATE"
    t.index ["CODE_TYPE"], name: "IX_FINDER_DEST"
  end

  create_table "b_form", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TIMESTAMP_X"
    t.string "NAME", null: false
    t.string "SID", limit: 50, null: false
    t.string "BUTTON"
    t.integer "C_SORT", default: 100
    t.string "FIRST_SITE_ID", limit: 2
    t.integer "IMAGE_ID"
    t.string "USE_CAPTCHA", limit: 1, default: "N"
    t.text "DESCRIPTION"
    t.string "DESCRIPTION_TYPE", limit: 4, default: "html", null: false
    t.text "FORM_TEMPLATE"
    t.string "USE_DEFAULT_TEMPLATE", limit: 1, default: "Y"
    t.string "SHOW_TEMPLATE"
    t.string "MAIL_EVENT_TYPE", limit: 50
    t.string "SHOW_RESULT_TEMPLATE"
    t.string "PRINT_RESULT_TEMPLATE"
    t.string "EDIT_RESULT_TEMPLATE"
    t.text "FILTER_RESULT_TEMPLATE"
    t.text "TABLE_RESULT_TEMPLATE"
    t.string "USE_RESTRICTIONS", limit: 1, default: "N"
    t.integer "RESTRICT_USER", default: 0
    t.integer "RESTRICT_TIME", default: 0
    t.string "RESTRICT_STATUS"
    t.string "STAT_EVENT1"
    t.string "STAT_EVENT2"
    t.string "STAT_EVENT3"
    t.index ["SID"], name: "IX_SID"
  end

  create_table "b_form_2_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.integer "GROUP_ID", default: 0, null: false
    t.integer "PERMISSION", default: 1, null: false
    t.index ["FORM_ID"], name: "IX_FORM_ID"
  end

  create_table "b_form_2_mail_template", primary_key: ["FORM_ID", "MAIL_TEMPLATE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.integer "MAIL_TEMPLATE_ID", default: 0, null: false
  end

  create_table "b_form_2_site", primary_key: ["FORM_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.string "SITE_ID", limit: 2, null: false
  end

  create_table "b_form_answer", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FIELD_ID", default: 0, null: false
    t.datetime "TIMESTAMP_X"
    t.text "MESSAGE"
    t.integer "C_SORT", default: 100, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "VALUE"
    t.string "FIELD_TYPE", default: "text", null: false
    t.integer "FIELD_WIDTH"
    t.integer "FIELD_HEIGHT"
    t.text "FIELD_PARAM"
    t.index ["FIELD_ID"], name: "IX_FIELD_ID"
  end

  create_table "b_form_crm", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", default: "", null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.string "URL", default: "", null: false
    t.string "AUTH_HASH", limit: 32, default: ""
  end

  create_table "b_form_crm_field", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "LINK_ID", default: 0, null: false
    t.integer "FIELD_ID", default: 0
    t.string "FIELD_ALT", limit: 100, default: ""
    t.string "CRM_FIELD", default: "", null: false
    t.index ["LINK_ID"], name: "ix_b_form_crm_field_1"
  end

  create_table "b_form_crm_link", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.integer "CRM_ID", default: 0, null: false
    t.string "LINK_TYPE", limit: 1, default: "M", null: false
    t.index ["FORM_ID", "CRM_ID"], name: "ux_b_form_crm_link_1", unique: true
  end

  create_table "b_form_field", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.datetime "TIMESTAMP_X"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.text "TITLE"
    t.string "TITLE_TYPE", limit: 4, default: "text", null: false
    t.string "SID", limit: 50
    t.integer "C_SORT", default: 100, null: false
    t.string "ADDITIONAL", limit: 1, default: "N", null: false
    t.string "REQUIRED", limit: 1, default: "N", null: false
    t.string "IN_FILTER", limit: 1, default: "N", null: false
    t.string "IN_RESULTS_TABLE", limit: 1, default: "N", null: false
    t.string "IN_EXCEL_TABLE", limit: 1, default: "Y", null: false
    t.string "FIELD_TYPE", limit: 50
    t.integer "IMAGE_ID"
    t.text "COMMENTS"
    t.text "FILTER_TITLE"
    t.text "RESULTS_TABLE_TITLE"
    t.index ["FORM_ID"], name: "IX_FORM_ID"
    t.index ["SID"], name: "IX_SID"
  end

  create_table "b_form_field_filter", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FIELD_ID", default: 0, null: false
    t.string "PARAMETER_NAME", limit: 50, null: false
    t.string "FILTER_TYPE", limit: 50, null: false
    t.index ["FIELD_ID"], name: "IX_FIELD_ID"
  end

  create_table "b_form_field_validator", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.integer "FIELD_ID", default: 0, null: false
    t.datetime "TIMESTAMP_X"
    t.string "ACTIVE", limit: 1, default: "y"
    t.integer "C_SORT", default: 100
    t.string "VALIDATOR_SID", default: "", null: false
    t.text "PARAMS"
    t.index ["FIELD_ID"], name: "IX_FIELD_ID"
    t.index ["FORM_ID"], name: "IX_FORM_ID"
  end

  create_table "b_form_menu", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.string "LID", limit: 2, null: false
    t.string "MENU", limit: 50, null: false
    t.index ["FORM_ID"], name: "IX_FORM_ID"
  end

  create_table "b_form_result", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TIMESTAMP_X"
    t.datetime "DATE_CREATE"
    t.integer "STATUS_ID", default: 0, null: false
    t.integer "FORM_ID", default: 0, null: false
    t.integer "USER_ID"
    t.string "USER_AUTH", limit: 1, default: "N", null: false
    t.integer "STAT_GUEST_ID"
    t.integer "STAT_SESSION_ID"
    t.string "SENT_TO_CRM", limit: 1, default: "N"
    t.index ["FORM_ID"], name: "IX_FORM_ID"
    t.index ["SENT_TO_CRM"], name: "IX_SENT_TO_CRM"
    t.index ["STATUS_ID"], name: "IX_STATUS_ID"
  end

  create_table "b_form_result_answer", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RESULT_ID", default: 0, null: false
    t.integer "FORM_ID", default: 0, null: false
    t.integer "FIELD_ID", default: 0, null: false
    t.integer "ANSWER_ID"
    t.text "ANSWER_TEXT"
    t.text "ANSWER_TEXT_SEARCH", size: :long
    t.string "ANSWER_VALUE"
    t.text "ANSWER_VALUE_SEARCH", size: :long
    t.text "USER_TEXT", size: :long
    t.text "USER_TEXT_SEARCH", size: :long
    t.datetime "USER_DATE"
    t.integer "USER_FILE_ID"
    t.string "USER_FILE_NAME"
    t.string "USER_FILE_IS_IMAGE", limit: 1
    t.string "USER_FILE_HASH"
    t.string "USER_FILE_SUFFIX"
    t.integer "USER_FILE_SIZE"
    t.index ["ANSWER_ID"], name: "IX_ANSWER_ID"
    t.index ["FIELD_ID"], name: "IX_FIELD_ID"
    t.index ["RESULT_ID"], name: "IX_RESULT_ID"
  end

  create_table "b_form_status", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORM_ID", default: 0, null: false
    t.datetime "TIMESTAMP_X"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "C_SORT", default: 100, null: false
    t.string "TITLE", null: false
    t.text "DESCRIPTION"
    t.string "DEFAULT_VALUE", limit: 1, default: "N", null: false
    t.string "CSS", default: "statusgreen"
    t.string "HANDLER_OUT"
    t.string "HANDLER_IN"
    t.string "MAIL_EVENT_TYPE"
    t.index ["FORM_ID"], name: "IX_FORM_ID"
  end

  create_table "b_form_status_2_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "STATUS_ID", default: 0, null: false
    t.integer "GROUP_ID", default: 0, null: false
    t.string "PERMISSION", limit: 50, null: false
    t.index ["STATUS_ID", "GROUP_ID"], name: "IX_FORM_STATUS_GROUP"
  end

  create_table "b_form_status_2_mail_template", primary_key: ["STATUS_ID", "MAIL_TEMPLATE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "STATUS_ID", default: 0, null: false
    t.integer "MAIL_TEMPLATE_ID", default: 0, null: false
  end

  create_table "b_forum", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_GROUP_ID"
    t.string "NAME", null: false
    t.text "DESCRIPTION"
    t.integer "SORT", default: 150, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "ALLOW_HTML", limit: 1, default: "N", null: false
    t.string "ALLOW_ANCHOR", limit: 1, default: "Y", null: false
    t.string "ALLOW_BIU", limit: 1, default: "Y", null: false
    t.string "ALLOW_IMG", limit: 1, default: "Y", null: false
    t.string "ALLOW_VIDEO", limit: 1, default: "Y", null: false
    t.string "ALLOW_LIST", limit: 1, default: "Y", null: false
    t.string "ALLOW_QUOTE", limit: 1, default: "Y", null: false
    t.string "ALLOW_CODE", limit: 1, default: "Y", null: false
    t.string "ALLOW_FONT", limit: 1, default: "Y", null: false
    t.string "ALLOW_SMILES", limit: 1, default: "Y", null: false
    t.string "ALLOW_UPLOAD", limit: 1, default: "N", null: false
    t.string "ALLOW_TABLE", limit: 1, default: "N", null: false
    t.string "ALLOW_ALIGN", limit: 1, default: "Y", null: false
    t.string "ALLOW_UPLOAD_EXT"
    t.string "ALLOW_MOVE_TOPIC", limit: 1, default: "Y", null: false
    t.string "ALLOW_TOPIC_TITLED", limit: 1, default: "N", null: false
    t.string "ALLOW_NL2BR", limit: 1, default: "N", null: false
    t.string "ALLOW_SIGNATURE", limit: 1, default: "Y", null: false
    t.string "PATH2FORUM_MESSAGE"
    t.string "ASK_GUEST_EMAIL", limit: 1, default: "N", null: false
    t.string "USE_CAPTCHA", limit: 1, default: "N", null: false
    t.string "INDEXATION", limit: 1, default: "Y", null: false
    t.string "DEDUPLICATION", limit: 1, default: "Y", null: false
    t.string "MODERATION", limit: 1, default: "N", null: false
    t.string "ORDER_BY", limit: 1, default: "P", null: false
    t.string "ORDER_DIRECTION", limit: 4, default: "DESC", null: false
    t.string "LID", limit: 2, default: "ru", null: false
    t.integer "TOPICS", default: 0, null: false
    t.integer "POSTS", default: 0, null: false
    t.integer "LAST_POSTER_ID"
    t.string "LAST_POSTER_NAME"
    t.datetime "LAST_POST_DATE"
    t.bigint "LAST_MESSAGE_ID"
    t.integer "POSTS_UNAPPROVED", default: 0
    t.integer "ABS_LAST_POSTER_ID"
    t.string "ABS_LAST_POSTER_NAME"
    t.datetime "ABS_LAST_POST_DATE"
    t.bigint "ABS_LAST_MESSAGE_ID"
    t.string "EVENT1", default: "forum"
    t.string "EVENT2", default: "message"
    t.string "EVENT3"
    t.string "HTML"
    t.string "XML_ID"
    t.index ["ACTIVE"], name: "IX_FORUM_ACTIVE"
    t.index ["FORUM_GROUP_ID"], name: "IX_FORUM_GROUP_ID"
    t.index ["SORT"], name: "IX_FORUM_SORT"
  end

  create_table "b_forum2site", primary_key: ["FORUM_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.string "PATH2FORUM_MESSAGE", limit: 250
  end

  create_table "b_forum_dictionary", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TITLE", limit: 50
    t.string "TYPE", limit: 1
  end

  create_table "b_forum_email", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "EMAIL_FORUM_ACTIVE", limit: 1, default: "Y", null: false
    t.integer "FORUM_ID", null: false
    t.integer "SOCNET_GROUP_ID"
    t.integer "MAIL_FILTER_ID", null: false
    t.string "EMAIL", null: false
    t.string "USE_EMAIL", limit: 1
    t.string "EMAIL_GROUP"
    t.string "SUBJECT_SUF", limit: 50
    t.string "USE_SUBJECT", limit: 1
    t.string "URL_TEMPLATES_MESSAGE"
    t.string "NOT_MEMBER_POST", limit: 1
    t.index ["FORUM_ID", "SOCNET_GROUP_ID"], name: "IX_B_FORUM_EMAIL_FORUM_SOC"
    t.index ["MAIL_FILTER_ID"], name: "IX_B_FORUM_EMAIL_FILTER_ID"
  end

  create_table "b_forum_file", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_ID"
    t.integer "TOPIC_ID"
    t.integer "MESSAGE_ID"
    t.integer "FILE_ID", null: false
    t.integer "USER_ID"
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "HITS"
    t.index ["FILE_ID"], name: "IX_FORUM_FILE_FILE"
    t.index ["FORUM_ID"], name: "IX_FORUM_FILE_FORUM"
    t.index ["MESSAGE_ID"], name: "IX_FORUM_FILE_MESSAGE"
    t.index ["TOPIC_ID"], name: "IX_FORUM_FILE_TOPIC"
  end

  create_table "b_forum_filter", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DICTIONARY_ID"
    t.string "WORDS"
    t.text "PATTERN"
    t.string "REPLACEMENT"
    t.text "DESCRIPTION"
    t.string "USE_IT", limit: 50
    t.string "PATTERN_CREATE", limit: 5
    t.index ["PATTERN_CREATE"], name: "IX_B_FORUM_FILTER_3"
    t.index ["USE_IT"], name: "IX_B_FORUM_FILTER_2"
  end

  create_table "b_forum_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SORT", default: 150, null: false
    t.integer "PARENT_ID"
    t.integer "LEFT_MARGIN"
    t.integer "RIGHT_MARGIN"
    t.integer "DEPTH_LEVEL"
    t.string "XML_ID"
  end

  create_table "b_forum_group_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_GROUP_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", null: false
    t.string "DESCRIPTION"
    t.index ["FORUM_GROUP_ID", "LID"], name: "UX_FORUM_GROUP", unique: true
  end

  create_table "b_forum_letter", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DICTIONARY_ID", default: 0
    t.string "LETTER", limit: 50
    t.string "REPLACEMENT"
  end

  create_table "b_forum_message", primary_key: "ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_ID", null: false
    t.bigint "TOPIC_ID", null: false
    t.string "USE_SMILES", limit: 1, default: "Y", null: false
    t.string "NEW_TOPIC", limit: 1, default: "N", null: false
    t.string "APPROVED", limit: 1, default: "Y", null: false
    t.string "SOURCE_ID", default: "WEB", null: false
    t.datetime "POST_DATE", null: false
    t.text "POST_MESSAGE"
    t.text "POST_MESSAGE_HTML"
    t.text "POST_MESSAGE_FILTER"
    t.string "POST_MESSAGE_CHECK", limit: 32
    t.integer "ATTACH_IMG"
    t.string "PARAM1", limit: 2
    t.integer "PARAM2"
    t.integer "AUTHOR_ID"
    t.string "AUTHOR_NAME"
    t.string "AUTHOR_EMAIL"
    t.string "AUTHOR_IP"
    t.string "AUTHOR_REAL_IP", limit: 128
    t.integer "GUEST_ID"
    t.integer "EDITOR_ID"
    t.string "EDITOR_NAME"
    t.string "EDITOR_EMAIL"
    t.text "EDIT_REASON"
    t.datetime "EDIT_DATE"
    t.string "XML_ID"
    t.text "HTML"
    t.text "MAIL_HEADER"
    t.index ["APPROVED"], name: "IX_FORUM_MESSAGE_APPROVED"
    t.index ["AUTHOR_ID", "APPROVED", "FORUM_ID", "ID"], name: "IX_FORUM_MESSAGE_AUTHOR"
    t.index ["AUTHOR_ID", "FORUM_ID", "ID", "APPROVED", "TOPIC_ID"], name: "IX_FORUM_MESSAGE_AUTHOR_FORUM_ID"
    t.index ["AUTHOR_ID", "TOPIC_ID", "ID"], name: "IX_FORUM_MESSAGE_AUTHOR_TOPIC_ID"
    t.index ["FORUM_ID", "APPROVED"], name: "IX_FORUM_MESSAGE_FORUM"
    t.index ["PARAM2"], name: "IX_FORUM_MESSAGE_PARAM2"
    t.index ["POST_DATE", "AUTHOR_ID"], name: "IX_FORUM_MESSAGE_DATE_AUTHOR_ID"
    t.index ["TOPIC_ID", "APPROVED", "ID"], name: "IX_FORUM_MESSAGE_TOPIC"
    t.index ["XML_ID"], name: "IX_FORUM_MESSAGE_XML_ID"
  end

  create_table "b_forum_perms", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_ID", null: false
    t.integer "GROUP_ID", null: false
    t.string "PERMISSION", limit: 1, default: "M", null: false
    t.index ["FORUM_ID", "GROUP_ID"], name: "IX_FORUM_PERMS_FORUM"
    t.index ["GROUP_ID"], name: "IX_FORUM_PERMS_GROUP"
  end

  create_table "b_forum_pm_folder", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TITLE", null: false
    t.integer "USER_ID", null: false
    t.integer "SORT", null: false
    t.index ["USER_ID", "ID", "SORT", "TITLE"], name: "IX_B_FORUM_PM_FOLDER_USER_IST"
  end

  create_table "b_forum_points", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "MIN_POINTS", null: false
    t.string "CODE", limit: 100
    t.integer "VOTES", null: false
    t.index ["MIN_POINTS"], name: "UX_FORUM_P_MP", unique: true
  end

  create_table "b_forum_points2post", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "MIN_NUM_POSTS", null: false
    t.decimal "POINTS_PER_POST", precision: 18, scale: 4, default: "0.0", null: false
    t.index ["MIN_NUM_POSTS"], name: "UX_FORUM_P2P_MNP", unique: true
  end

  create_table "b_forum_points_lang", primary_key: ["POINTS_ID", "LID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POINTS_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 250
  end

  create_table "b_forum_private_message", primary_key: "ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "AUTHOR_ID", default: 0
    t.integer "RECIPIENT_ID", default: 0
    t.datetime "POST_DATE"
    t.string "POST_SUBJ"
    t.text "POST_MESSAGE", null: false
    t.integer "USER_ID", null: false
    t.integer "FOLDER_ID", null: false
    t.string "IS_READ", limit: 1
    t.string "REQUEST_IS_READ", limit: 1
    t.string "USE_SMILES", limit: 1
    t.index ["AUTHOR_ID", "FOLDER_ID", "IS_READ"], name: "IX_B_FORUM_PM_AFR"
    t.index ["POST_DATE"], name: "IX_B_FORUM_PM_POST_DATE"
    t.index ["USER_ID", "FOLDER_ID", "POST_DATE"], name: "IX_B_FORUM_PM_UFP"
    t.index ["USER_ID"], name: "IX_B_FORUM_PM_USER"
  end

  create_table "b_forum_rank", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 100
    t.integer "MIN_NUM_POSTS", default: 0, null: false
  end

  create_table "b_forum_rank_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RANK_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.index ["RANK_ID", "LID"], name: "UX_FORUM_RANK", unique: true
  end

  create_table "b_forum_stat", primary_key: "ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID"
    t.string "IP_ADDRESS", limit: 128
    t.string "PHPSESSID"
    t.datetime "LAST_VISIT"
    t.string "SITE_ID", limit: 2
    t.integer "FORUM_ID", limit: 2, default: 0, null: false
    t.integer "TOPIC_ID"
    t.string "SHOW_NAME", limit: 101
    t.index ["FORUM_ID", "LAST_VISIT"], name: "IX_B_FORUM_STAT_FORUM_ID"
    t.index ["PHPSESSID"], name: "IX_B_FORUM_STAT_PHPSESSID"
    t.index ["SITE_ID", "LAST_VISIT"], name: "IX_B_FORUM_STAT_SITE_ID"
    t.index ["TOPIC_ID", "LAST_VISIT"], name: "IX_B_FORUM_STAT_TOPIC_ID"
  end

  create_table "b_forum_subscribe", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "FORUM_ID", null: false
    t.integer "TOPIC_ID"
    t.datetime "START_DATE", null: false
    t.integer "LAST_SEND"
    t.string "NEW_TOPIC_ONLY", limit: 50, default: "N", null: false
    t.string "SITE_ID", limit: 2, default: "ru", null: false
    t.integer "SOCNET_GROUP_ID"
    t.index ["USER_ID", "FORUM_ID", "TOPIC_ID", "SOCNET_GROUP_ID"], name: "UX_FORUM_SUBSCRIBE_USER", unique: true
  end

  create_table "b_forum_topic", primary_key: "ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FORUM_ID", null: false
    t.bigint "TOPIC_ID"
    t.string "TITLE", null: false
    t.string "TITLE_SEO"
    t.string "TAGS"
    t.string "DESCRIPTION"
    t.string "ICON"
    t.string "STATE", limit: 1, default: "Y", null: false
    t.string "APPROVED", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 150, null: false
    t.integer "VIEWS", default: 0, null: false
    t.integer "USER_START_ID"
    t.string "USER_START_NAME"
    t.datetime "START_DATE", null: false
    t.integer "POSTS", default: 0, null: false
    t.integer "LAST_POSTER_ID"
    t.string "LAST_POSTER_NAME", null: false
    t.datetime "LAST_POST_DATE", null: false
    t.bigint "LAST_MESSAGE_ID"
    t.integer "POSTS_UNAPPROVED", default: 0
    t.integer "ABS_LAST_POSTER_ID"
    t.string "ABS_LAST_POSTER_NAME"
    t.datetime "ABS_LAST_POST_DATE"
    t.bigint "ABS_LAST_MESSAGE_ID"
    t.string "XML_ID"
    t.text "HTML"
    t.integer "SOCNET_GROUP_ID"
    t.integer "OWNER_ID"
    t.index ["ABS_LAST_POST_DATE"], name: "IX_FORUM_TOPIC_ABS_L_POST_DATE"
    t.index ["APPROVED"], name: "IX_FORUM_TOPIC_APPROVED"
    t.index ["FORUM_ID", "APPROVED"], name: "IX_FORUM_TOPIC_FORUM"
    t.index ["FORUM_ID", "TITLE_SEO"], name: "IX_FORUM_TOPIC_TITLE_SEO"
    t.index ["LAST_POST_DATE"], name: "IX_FORUM_TOPIC_LAST_POST_DATE"
    t.index ["START_DATE", "USER_START_ID"], name: "IX_FORUM_TOPIC_DATE_USER_START_ID"
    t.index ["TITLE_SEO"], name: "IX_FORUM_TOPIC_TITLE_SEO2"
    t.index ["USER_START_ID"], name: "IX_FORUM_TOPIC_USER_START_ID"
    t.index ["XML_ID"], name: "IX_FORUM_TOPIC_XML_ID"
  end

  create_table "b_forum_user", primary_key: "ID", options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "ALIAS", limit: 64
    t.string "DESCRIPTION"
    t.string "IP_ADDRESS", limit: 128
    t.integer "AVATAR"
    t.integer "NUM_POSTS", default: 0
    t.text "INTERESTS"
    t.integer "LAST_POST"
    t.string "ALLOW_POST", limit: 1, default: "Y", null: false
    t.datetime "LAST_VISIT", null: false
    t.date "DATE_REG", null: false
    t.string "REAL_IP_ADDRESS", limit: 128
    t.string "SIGNATURE"
    t.string "SHOW_NAME", limit: 1, default: "Y", null: false
    t.integer "RANK_ID"
    t.integer "POINTS", default: 0, null: false
    t.string "HIDE_FROM_ONLINE", limit: 1, default: "N", null: false
    t.string "SUBSC_GROUP_MESSAGE", limit: 1, default: "N", null: false
    t.string "SUBSC_GET_MY_MESSAGE", limit: 1, default: "Y", null: false
    t.index ["USER_ID"], name: "IX_FORUM_USER_USER6", unique: true
  end

  create_table "b_forum_user_forum", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID"
    t.integer "FORUM_ID"
    t.datetime "LAST_VISIT"
    t.datetime "MAIN_LAST_VISIT"
    t.index ["USER_ID", "FORUM_ID"], name: "IX_B_FORUM_USER_FORUM_ID1"
  end

  create_table "b_forum_user_points", primary_key: ["FROM_USER_ID", "TO_USER_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FROM_USER_ID", null: false
    t.integer "TO_USER_ID", null: false
    t.integer "POINTS", default: 0, null: false
    t.datetime "DATE_UPDATE"
    t.index ["TO_USER_ID"], name: "IX_B_FORUM_USER_POINTS_TO_USER"
  end

  create_table "b_forum_user_topic", primary_key: ["TOPIC_ID", "USER_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.bigint "ID", null: false, auto_increment: true
    t.integer "TOPIC_ID", null: false
    t.integer "USER_ID", null: false
    t.integer "FORUM_ID"
    t.datetime "LAST_VISIT"
    t.index ["ID"], name: "ID"
    t.index ["USER_ID", "FORUM_ID", "TOPIC_ID"], name: "IX_B_FORUM_USER_FORUM_ID2"
  end

  create_table "b_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "C_SORT", default: 100, null: false
    t.string "ANONYMOUS", limit: 1, default: "N", null: false
    t.string "NAME", null: false
    t.string "DESCRIPTION"
    t.text "SECURITY_POLICY"
    t.string "STRING_ID"
  end

  create_table "b_group_collection_task", primary_key: ["GROUP_ID", "TASK_ID", "COLLECTION_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.integer "TASK_ID", null: false
    t.integer "COLLECTION_ID", null: false
  end

  create_table "b_group_subordinate", primary_key: "ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "AR_SUBGROUP_ID", null: false
  end

  create_table "b_group_task", primary_key: ["GROUP_ID", "TASK_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.integer "TASK_ID", null: false
    t.string "EXTERNAL_ID", limit: 50, default: ""
  end

  create_table "b_hlblock_entity", primary_key: "ID", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100, null: false
    t.string "TABLE_NAME", limit: 64, null: false
  end

  create_table "b_hot_keys", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "KEYS_STRING", limit: 20, null: false
    t.integer "CODE_ID", null: false
    t.integer "USER_ID", null: false
    t.index ["CODE_ID", "USER_ID"], name: "ix_b_hot_keys_co_u", unique: true
    t.index ["CODE_ID"], name: "ix_hot_keys_code"
    t.index ["USER_ID"], name: "ix_hot_keys_user"
  end

  create_table "b_hot_keys_code", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CLASS_NAME", limit: 50
    t.string "CODE"
    t.string "NAME"
    t.string "COMMENTS"
    t.string "TITLE_OBJ", limit: 50
    t.string "URL"
    t.boolean "IS_CUSTOM", default: true, null: false
    t.index ["CLASS_NAME"], name: "ix_hot_keys_code_cn"
    t.index ["URL"], name: "ix_hot_keys_code_url"
  end

  create_table "b_iblock", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "IBLOCK_TYPE_ID", limit: 50, null: false
    t.string "LID", limit: 2, null: false
    t.string "CODE", limit: 50
    t.string "NAME", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 500, null: false
    t.string "LIST_PAGE_URL"
    t.string "DETAIL_PAGE_URL"
    t.string "SECTION_PAGE_URL"
    t.string "CANONICAL_PAGE_URL"
    t.integer "PICTURE"
    t.text "DESCRIPTION"
    t.string "DESCRIPTION_TYPE", limit: 4, default: "text", null: false
    t.integer "RSS_TTL", default: 24, null: false
    t.string "RSS_ACTIVE", limit: 1, default: "Y", null: false
    t.string "RSS_FILE_ACTIVE", limit: 1, default: "N", null: false
    t.integer "RSS_FILE_LIMIT"
    t.integer "RSS_FILE_DAYS"
    t.string "RSS_YANDEX_ACTIVE", limit: 1, default: "N", null: false
    t.string "XML_ID"
    t.string "TMP_ID", limit: 40
    t.string "INDEX_ELEMENT", limit: 1, default: "Y", null: false
    t.string "INDEX_SECTION", limit: 1, default: "N", null: false
    t.string "WORKFLOW", limit: 1, default: "Y", null: false
    t.string "BIZPROC", limit: 1, default: "N", null: false
    t.string "SECTION_CHOOSER", limit: 1
    t.string "LIST_MODE", limit: 1
    t.string "RIGHTS_MODE", limit: 1
    t.string "SECTION_PROPERTY", limit: 1
    t.string "PROPERTY_INDEX", limit: 1
    t.integer "VERSION", default: 1, null: false
    t.integer "LAST_CONV_ELEMENT", default: 0, null: false
    t.integer "SOCNET_GROUP_ID"
    t.string "EDIT_FILE_BEFORE"
    t.string "EDIT_FILE_AFTER"
    t.string "SECTIONS_NAME", limit: 100
    t.string "SECTION_NAME", limit: 100
    t.string "ELEMENTS_NAME", limit: 100
    t.string "ELEMENT_NAME", limit: 100
    t.index ["IBLOCK_TYPE_ID", "LID", "ACTIVE"], name: "ix_iblock"
  end

  create_table "b_iblock_20_index", primary_key: ["SECTION_ID", "FACET_ID", "VALUE", "VALUE_NUM", "ELEMENT_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SECTION_ID", null: false
    t.integer "ELEMENT_ID", null: false
    t.integer "FACET_ID", null: false
    t.integer "VALUE", null: false
    t.float "VALUE_NUM", limit: 53, null: false
    t.integer "INCLUDE_SUBSECTIONS", null: false
    t.index ["ELEMENT_ID", "SECTION_ID", "FACET_ID"], name: "IX_b_iblock_20_index_1"
    t.index ["SECTION_ID", "FACET_ID", "VALUE_NUM", "VALUE", "ELEMENT_ID"], name: "IX_b_iblock_20_index_0"
  end

  create_table "b_iblock_20_index_val", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "VALUE", limit: 2000, null: false
    t.index ["VALUE"], name: "IX_b_iblock_20_index_val_0", length: 200
  end

  create_table "b_iblock_cache", primary_key: "CACHE_KEY", id: :string, limit: 35, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "CACHE", size: :long, null: false
    t.datetime "CACHE_DATE", null: false
  end

  create_table "b_iblock_element", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TIMESTAMP_X"
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "IBLOCK_ID", default: 0, null: false
    t.integer "IBLOCK_SECTION_ID"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "ACTIVE_FROM"
    t.datetime "ACTIVE_TO"
    t.integer "SORT", default: 500, null: false
    t.string "NAME", null: false
    t.integer "PREVIEW_PICTURE"
    t.text "PREVIEW_TEXT"
    t.string "PREVIEW_TEXT_TYPE", limit: 4, default: "text", null: false
    t.integer "DETAIL_PICTURE"
    t.text "DETAIL_TEXT", size: :long
    t.string "DETAIL_TEXT_TYPE", limit: 4, default: "text", null: false
    t.text "SEARCHABLE_CONTENT"
    t.integer "WF_STATUS_ID", default: 1
    t.integer "WF_PARENT_ELEMENT_ID"
    t.string "WF_NEW", limit: 1
    t.integer "WF_LOCKED_BY"
    t.datetime "WF_DATE_LOCK"
    t.text "WF_COMMENTS"
    t.string "IN_SECTIONS", limit: 1, default: "N", null: false
    t.string "XML_ID"
    t.string "CODE"
    t.string "TAGS"
    t.string "TMP_ID", limit: 40
    t.integer "WF_LAST_HISTORY_ID"
    t.integer "SHOW_COUNTER"
    t.datetime "SHOW_COUNTER_START"
    t.index ["IBLOCK_ID", "CODE"], name: "ix_iblock_element_code"
    t.index ["IBLOCK_ID", "IBLOCK_SECTION_ID"], name: "ix_iblock_element_1"
    t.index ["IBLOCK_ID", "XML_ID", "WF_PARENT_ELEMENT_ID"], name: "ix_iblock_element_4"
    t.index ["WF_PARENT_ELEMENT_ID"], name: "ix_iblock_element_3"
  end

  create_table "b_iblock_element_iprop", primary_key: ["ELEMENT_ID", "IPROP_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "SECTION_ID", null: false
    t.integer "ELEMENT_ID", null: false
    t.integer "IPROP_ID", null: false
    t.text "VALUE", null: false
    t.index ["IBLOCK_ID"], name: "ix_b_iblock_element_iprop_1"
    t.index ["IPROP_ID"], name: "ix_b_iblock_element_iprop_0"
  end

  create_table "b_iblock_element_lock", primary_key: "IBLOCK_ELEMENT_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_LOCK"
    t.string "LOCKED_BY", limit: 32
  end

  create_table "b_iblock_element_property", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_PROPERTY_ID", null: false
    t.integer "IBLOCK_ELEMENT_ID", null: false
    t.text "VALUE", null: false
    t.string "VALUE_TYPE", limit: 4, default: "text", null: false
    t.integer "VALUE_ENUM"
    t.decimal "VALUE_NUM", precision: 18, scale: 4
    t.string "DESCRIPTION"
    t.index ["IBLOCK_ELEMENT_ID", "IBLOCK_PROPERTY_ID"], name: "ix_iblock_element_property_1"
    t.index ["IBLOCK_PROPERTY_ID"], name: "ix_iblock_element_property_2"
    t.index ["VALUE_ENUM", "IBLOCK_PROPERTY_ID"], name: "ix_iblock_element_prop_enum"
    t.index ["VALUE_NUM", "IBLOCK_PROPERTY_ID"], name: "ix_iblock_element_prop_num"
  end

  create_table "b_iblock_element_right", primary_key: ["RIGHT_ID", "ELEMENT_ID", "SECTION_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "SECTION_ID", null: false
    t.integer "ELEMENT_ID", null: false
    t.integer "RIGHT_ID", null: false
    t.string "IS_INHERITED", limit: 1, null: false
    t.index ["ELEMENT_ID", "IBLOCK_ID"], name: "ix_b_iblock_element_right_1"
    t.index ["IBLOCK_ID", "RIGHT_ID"], name: "ix_b_iblock_element_right_2"
  end

  create_table "b_iblock_fields", primary_key: ["IBLOCK_ID", "FIELD_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "FIELD_ID", limit: 50, null: false
    t.string "IS_REQUIRED", limit: 1
    t.text "DEFAULT_VALUE", size: :long
  end

  create_table "b_iblock_group", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "GROUP_ID", null: false
    t.string "PERMISSION", limit: 1, null: false
    t.index ["IBLOCK_ID", "GROUP_ID"], name: "ux_iblock_group_1", unique: true
  end

  create_table "b_iblock_iblock_iprop", primary_key: ["IBLOCK_ID", "IPROP_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "IPROP_ID", null: false
    t.text "VALUE", null: false
    t.index ["IPROP_ID"], name: "ix_b_iblock_iblock_iprop_0"
  end

  create_table "b_iblock_iproperty", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "CODE", limit: 50, null: false
    t.string "ENTITY_TYPE", limit: 1, null: false
    t.integer "ENTITY_ID", null: false
    t.text "TEMPLATE", null: false
    t.index ["IBLOCK_ID", "ENTITY_TYPE", "ENTITY_ID"], name: "ix_b_iblock_iprop_0"
  end

  create_table "b_iblock_messages", primary_key: ["IBLOCK_ID", "MESSAGE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "MESSAGE_ID", limit: 50, null: false
    t.string "MESSAGE_TEXT"
  end

  create_table "b_iblock_offers_tmp", primary_key: "ID", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_IBLOCK_ID", null: false, unsigned: true
    t.integer "OFFERS_IBLOCK_ID", null: false, unsigned: true
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "b_iblock_property", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "IBLOCK_ID", null: false
    t.string "NAME", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 500, null: false
    t.string "CODE", limit: 50
    t.text "DEFAULT_VALUE"
    t.string "PROPERTY_TYPE", limit: 1, default: "S", null: false
    t.integer "ROW_COUNT", default: 1, null: false
    t.integer "COL_COUNT", default: 30, null: false
    t.string "LIST_TYPE", limit: 1, default: "L", null: false
    t.string "MULTIPLE", limit: 1, default: "N", null: false
    t.string "XML_ID", limit: 100
    t.string "FILE_TYPE", limit: 200
    t.integer "MULTIPLE_CNT"
    t.string "TMP_ID", limit: 40
    t.integer "LINK_IBLOCK_ID"
    t.string "WITH_DESCRIPTION", limit: 1
    t.string "SEARCHABLE", limit: 1, default: "N", null: false
    t.string "FILTRABLE", limit: 1, default: "N", null: false
    t.string "IS_REQUIRED", limit: 1
    t.integer "VERSION", default: 1, null: false
    t.string "USER_TYPE"
    t.text "USER_TYPE_SETTINGS"
    t.string "HINT"
    t.index ["CODE"], name: "ix_iblock_property_2"
    t.index ["IBLOCK_ID"], name: "ix_iblock_property_1"
    t.index ["LINK_IBLOCK_ID"], name: "ix_iblock_property_3"
  end

  create_table "b_iblock_property_enum", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PROPERTY_ID", null: false
    t.string "VALUE", null: false
    t.string "DEF", limit: 1, default: "N", null: false
    t.integer "SORT", default: 500, null: false
    t.string "XML_ID", limit: 200, null: false
    t.string "TMP_ID", limit: 40
    t.index ["PROPERTY_ID", "XML_ID"], name: "ux_iblock_property_enum", unique: true
  end

  create_table "b_iblock_right", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "GROUP_CODE", limit: 50, null: false
    t.string "ENTITY_TYPE", limit: 32, null: false
    t.integer "ENTITY_ID", null: false
    t.string "DO_INHERIT", limit: 1, null: false
    t.integer "TASK_ID", null: false
    t.string "OP_SREAD", limit: 1, null: false
    t.string "OP_EREAD", limit: 1, null: false
    t.string "XML_ID", limit: 32
    t.index ["ENTITY_ID", "ENTITY_TYPE"], name: "ix_b_iblock_right_entity"
    t.index ["GROUP_CODE", "IBLOCK_ID"], name: "ix_b_iblock_right_group_code"
    t.index ["IBLOCK_ID", "ENTITY_TYPE", "ENTITY_ID"], name: "ix_b_iblock_right_iblock_id"
    t.index ["ID", "OP_EREAD", "GROUP_CODE"], name: "ix_b_iblock_right_op_eread"
    t.index ["ID", "OP_SREAD", "GROUP_CODE"], name: "ix_b_iblock_right_op_sread"
    t.index ["TASK_ID"], name: "ix_b_iblock_right_task_id"
  end

  create_table "b_iblock_rss", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "NODE", limit: 50, null: false
    t.string "NODE_VALUE", limit: 250
  end

  create_table "b_iblock_section", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "IBLOCK_ID", null: false
    t.integer "IBLOCK_SECTION_ID"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "GLOBAL_ACTIVE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 500, null: false
    t.string "NAME", null: false
    t.integer "PICTURE"
    t.integer "LEFT_MARGIN"
    t.integer "RIGHT_MARGIN"
    t.integer "DEPTH_LEVEL"
    t.text "DESCRIPTION"
    t.string "DESCRIPTION_TYPE", limit: 4, default: "text", null: false
    t.text "SEARCHABLE_CONTENT"
    t.string "CODE"
    t.string "XML_ID"
    t.string "TMP_ID", limit: 40
    t.integer "DETAIL_PICTURE"
    t.integer "SOCNET_GROUP_ID"
    t.index ["IBLOCK_ID", "CODE"], name: "ix_iblock_section_code"
    t.index ["IBLOCK_ID", "DEPTH_LEVEL"], name: "ix_iblock_section_depth_level"
    t.index ["IBLOCK_ID", "IBLOCK_SECTION_ID"], name: "ix_iblock_section_1"
    t.index ["IBLOCK_ID", "LEFT_MARGIN", "RIGHT_MARGIN"], name: "ix_iblock_section_left_margin"
    t.index ["IBLOCK_ID", "RIGHT_MARGIN", "LEFT_MARGIN"], name: "ix_iblock_section_right_margin"
  end

  create_table "b_iblock_section_element", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_SECTION_ID", null: false
    t.integer "IBLOCK_ELEMENT_ID", null: false
    t.integer "ADDITIONAL_PROPERTY_ID"
    t.index ["IBLOCK_ELEMENT_ID"], name: "UX_IBLOCK_SECTION_ELEMENT2"
    t.index ["IBLOCK_SECTION_ID", "IBLOCK_ELEMENT_ID", "ADDITIONAL_PROPERTY_ID"], name: "ux_iblock_section_element", unique: true
    t.index ["IBLOCK_SECTION_ID"], name: "index_b_iblock_section_element_on_IBLOCK_SECTION_ID"
  end

  create_table "b_iblock_section_iprop", primary_key: ["SECTION_ID", "IPROP_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "SECTION_ID", null: false
    t.integer "IPROP_ID", null: false
    t.text "VALUE", null: false
    t.index ["IBLOCK_ID"], name: "ix_b_iblock_section_iprop_1"
    t.index ["IPROP_ID"], name: "ix_b_iblock_section_iprop_0"
  end

  create_table "b_iblock_section_property", primary_key: ["IBLOCK_ID", "SECTION_ID", "PROPERTY_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "SECTION_ID", null: false
    t.integer "PROPERTY_ID", null: false
    t.string "SMART_FILTER", limit: 1
    t.string "DISPLAY_TYPE", limit: 1
    t.string "DISPLAY_EXPANDED", limit: 1
    t.string "FILTER_HINT"
    t.index ["PROPERTY_ID"], name: "ix_b_iblock_section_property_1"
    t.index ["SECTION_ID"], name: "ix_b_iblock_section_property_2"
  end

  create_table "b_iblock_section_right", primary_key: ["RIGHT_ID", "SECTION_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "SECTION_ID", null: false
    t.integer "RIGHT_ID", null: false
    t.string "IS_INHERITED", limit: 1, null: false
    t.index ["IBLOCK_ID", "RIGHT_ID"], name: "ix_b_iblock_section_right_2"
    t.index ["SECTION_ID", "IBLOCK_ID"], name: "ix_b_iblock_section_right_1"
  end

  create_table "b_iblock_sequence", primary_key: ["IBLOCK_ID", "CODE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "CODE", limit: 50, null: false
    t.integer "SEQ_VALUE"
  end

  create_table "b_iblock_site", primary_key: ["IBLOCK_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
  end

  create_table "b_iblock_type", primary_key: "ID", id: :string, limit: 50, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SECTIONS", limit: 1, default: "Y", null: false
    t.string "EDIT_FILE_BEFORE"
    t.string "EDIT_FILE_AFTER"
    t.string "IN_RSS", limit: 1, default: "N", null: false
    t.integer "SORT", default: 500, null: false
  end

  create_table "b_iblock_type_lang", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "IBLOCK_TYPE_ID", limit: 50, null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.string "SECTION_NAME", limit: 100
    t.string "ELEMENT_NAME", limit: 100, null: false
  end

  create_table "b_lang", primary_key: "LID", id: :string, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SORT", default: 100, null: false
    t.string "DEF", limit: 1, default: "N", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "NAME", limit: 50, null: false
    t.string "DIR", limit: 50, null: false
    t.string "FORMAT_DATE", limit: 50
    t.string "FORMAT_DATETIME", limit: 50
    t.string "FORMAT_NAME"
    t.integer "WEEK_START"
    t.string "CHARSET"
    t.string "LANGUAGE_ID", limit: 2, null: false
    t.string "DOC_ROOT"
    t.string "DOMAIN_LIMITED", limit: 1, default: "N", null: false
    t.string "SERVER_NAME"
    t.string "SITE_NAME"
    t.string "EMAIL"
    t.integer "CULTURE_ID"
  end

  create_table "b_lang_domain", primary_key: ["LID", "DOMAIN"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2, null: false
    t.string "DOMAIN", null: false
  end

  create_table "b_language", primary_key: "LID", id: :string, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SORT", default: 100, null: false
    t.string "DEF", limit: 1, default: "N", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "NAME", limit: 50, null: false
    t.string "FORMAT_DATE", limit: 50
    t.string "FORMAT_DATETIME", limit: 50
    t.string "FORMAT_NAME"
    t.integer "WEEK_START"
    t.string "CHARSET"
    t.string "DIRECTION", limit: 1
    t.integer "CULTURE_ID"
  end

  create_table "b_list_rubric", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2, null: false
    t.string "CODE", limit: 100
    t.string "NAME", limit: 100
    t.text "DESCRIPTION"
    t.integer "SORT", default: 100, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "AUTO", limit: 1, default: "N", null: false
    t.string "DAYS_OF_MONTH", limit: 100
    t.string "DAYS_OF_WEEK", limit: 15
    t.string "TIMES_OF_DAY"
    t.string "TEMPLATE", limit: 100
    t.datetime "LAST_EXECUTED"
    t.string "VISIBLE", limit: 1, default: "Y", null: false
    t.string "FROM_FIELD"
  end

  create_table "b_medialib_collection", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.text "DESCRIPTION"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "DATE_UPDATE", null: false
    t.integer "OWNER_ID"
    t.integer "PARENT_ID"
    t.string "SITE_ID", limit: 2
    t.string "KEYWORDS"
    t.integer "ITEMS_COUNT"
    t.integer "ML_TYPE", default: 0, null: false
  end

  create_table "b_medialib_collection_item", primary_key: ["ITEM_ID", "COLLECTION_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "COLLECTION_ID", null: false
    t.integer "ITEM_ID", null: false
  end

  create_table "b_medialib_item", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.string "ITEM_TYPE", limit: 30
    t.text "DESCRIPTION"
    t.datetime "DATE_CREATE", null: false
    t.datetime "DATE_UPDATE", null: false
    t.integer "SOURCE_ID", null: false
    t.string "KEYWORDS"
    t.text "SEARCHABLE_CONTENT"
  end

  create_table "b_medialib_type", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME"
    t.string "CODE", null: false
    t.string "EXT", null: false
    t.string "SYSTEM", limit: 1, default: "N", null: false
    t.text "DESCRIPTION"
  end

  create_table "b_mobileapp_app", primary_key: "CODE", id: :string, limit: 50, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SHORT_NAME", limit: 50, null: false
    t.string "NAME", limit: 50, null: false
    t.text "DESCRIPTION", null: false
    t.text "FILES", null: false
    t.text "LAUNCH_ICONS", null: false
    t.text "LAUNCH_SCREENS", null: false
    t.string "FOLDER", limit: 50, null: false
    t.datetime "DATE_CREATE", null: false
  end

  create_table "b_mobileapp_config", primary_key: ["APP_CODE", "PLATFORM"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "APP_CODE", limit: 150, null: false
    t.string "PLATFORM", limit: 150, null: false
    t.text "PARAMS", null: false
    t.datetime "DATE_CREATE", null: false
  end

  create_table "b_module", primary_key: "ID", id: :string, limit: 50, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "DATE_ACTIVE", default: -> { "CURRENT_TIMESTAMP" }, null: false
  end

  create_table "b_module_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50, null: false
    t.integer "GROUP_ID", null: false
    t.string "G_ACCESS", null: false
    t.string "SITE_ID", limit: 2
    t.index ["MODULE_ID", "GROUP_ID", "SITE_ID"], name: "UK_GROUP_MODULE", unique: true
  end

  create_table "b_module_to_module", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "SORT", default: 100, null: false
    t.string "FROM_MODULE_ID", limit: 50, null: false
    t.string "MESSAGE_ID", null: false
    t.string "TO_MODULE_ID", limit: 50, null: false
    t.string "TO_PATH"
    t.string "TO_CLASS"
    t.string "TO_METHOD"
    t.string "TO_METHOD_ARG"
    t.integer "VERSION"
    t.index ["FROM_MODULE_ID", "MESSAGE_ID", "TO_MODULE_ID", "TO_CLASS", "TO_METHOD"], name: "ix_module_to_module", length: 20
  end

  create_table "b_operation", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 50, null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.string "DESCRIPTION"
    t.string "BINDING", limit: 50, default: "module"
  end

  create_table "b_option", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50
    t.string "NAME", limit: 50, null: false
    t.text "VALUE"
    t.string "DESCRIPTION"
    t.string "SITE_ID", limit: 2
    t.index ["MODULE_ID", "NAME", "SITE_ID"], name: "ix_option", unique: true
    t.index ["NAME"], name: "ix_option_name"
  end

  create_table "b_perf_cache", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "HIT_ID"
    t.integer "COMPONENT_ID"
    t.integer "NN"
    t.float "CACHE_SIZE"
    t.string "OP_MODE", limit: 1
    t.text "MODULE_NAME"
    t.text "COMPONENT_NAME"
    t.text "BASE_DIR"
    t.text "INIT_DIR"
    t.text "FILE_NAME"
    t.text "FILE_PATH"
    t.index ["COMPONENT_ID"], name: "IX_B_PERF_CACHE_1"
    t.index ["HIT_ID", "NN"], name: "IX_B_PERF_CACHE_0", unique: true
  end

  create_table "b_perf_cluster", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "THREADS"
    t.integer "HITS"
    t.integer "ERRORS"
    t.float "PAGES_PER_SECOND"
    t.float "PAGE_EXEC_TIME"
    t.float "PAGE_RESP_TIME"
  end

  create_table "b_perf_component", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "HIT_ID"
    t.integer "NN"
    t.string "CACHE_TYPE", limit: 1
    t.integer "CACHE_SIZE"
    t.integer "CACHE_COUNT_R"
    t.integer "CACHE_COUNT_W"
    t.integer "CACHE_COUNT_C"
    t.float "COMPONENT_TIME"
    t.integer "QUERIES"
    t.float "QUERIES_TIME"
    t.text "COMPONENT_NAME"
    t.index ["HIT_ID", "NN"], name: "IX_B_PERF_COMPONENT_0", unique: true
  end

  create_table "b_perf_error", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "HIT_ID"
    t.integer "ERRNO"
    t.text "ERRSTR"
    t.text "ERRFILE"
    t.integer "ERRLINE"
    t.index ["HIT_ID"], name: "IX_B_PERF_ERROR_0"
  end

  create_table "b_perf_history", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.float "TOTAL_MARK"
    t.string "ACCELERATOR_ENABLED", limit: 1
  end

  create_table "b_perf_hit", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_HIT"
    t.string "IS_ADMIN", limit: 1
    t.string "REQUEST_METHOD", limit: 50
    t.string "SERVER_NAME", limit: 50
    t.integer "SERVER_PORT"
    t.text "SCRIPT_NAME"
    t.text "REQUEST_URI"
    t.integer "INCLUDED_FILES"
    t.integer "MEMORY_PEAK_USAGE"
    t.string "CACHE_TYPE", limit: 1
    t.integer "CACHE_SIZE"
    t.integer "CACHE_COUNT_R"
    t.integer "CACHE_COUNT_W"
    t.integer "CACHE_COUNT_C"
    t.integer "QUERIES"
    t.float "QUERIES_TIME"
    t.integer "COMPONENTS"
    t.float "COMPONENTS_TIME"
    t.string "SQL_LOG", limit: 1
    t.float "PAGE_TIME"
    t.float "PROLOG_TIME"
    t.float "PROLOG_BEFORE_TIME"
    t.float "AGENTS_TIME"
    t.float "PROLOG_AFTER_TIME"
    t.float "WORK_AREA_TIME"
    t.float "EPILOG_TIME"
    t.float "EPILOG_BEFORE_TIME"
    t.float "EVENTS_TIME"
    t.float "EPILOG_AFTER_TIME"
    t.integer "MENU_RECALC"
    t.index ["DATE_HIT"], name: "IX_B_PERF_HIT_0"
  end

  create_table "b_perf_index_ban", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "BAN_TYPE", limit: 1
    t.string "TABLE_NAME", limit: 50
    t.string "COLUMN_NAMES", limit: 250
  end

  create_table "b_perf_index_complete", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "BANNED", limit: 1
    t.string "TABLE_NAME", limit: 50
    t.string "COLUMN_NAMES", limit: 250
    t.string "INDEX_NAME", limit: 50
    t.index ["TABLE_NAME"], name: "ix_b_perf_index_complete_0"
  end

  create_table "b_perf_index_suggest", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SQL_MD5", limit: 32
    t.integer "SQL_COUNT"
    t.float "SQL_TIME"
    t.string "TABLE_NAME", limit: 50
    t.string "TABLE_ALIAS", limit: 50
    t.string "COLUMN_NAMES", limit: 250
    t.text "SQL_TEXT"
    t.text "SQL_EXPLAIN", size: :long
    t.index ["SQL_MD5"], name: "ix_b_perf_index_suggest_0"
  end

  create_table "b_perf_index_suggest_sql", primary_key: ["SUGGEST_ID", "SQL_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SUGGEST_ID", null: false
    t.integer "SQL_ID", null: false
    t.index ["SQL_ID", "SUGGEST_ID"], name: "ix_b_perf_index_suggest_sql_0"
  end

  create_table "b_perf_sql", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "HIT_ID"
    t.integer "COMPONENT_ID"
    t.integer "NN"
    t.float "QUERY_TIME"
    t.integer "NODE_ID"
    t.text "MODULE_NAME"
    t.text "COMPONENT_NAME"
    t.text "SQL_TEXT"
    t.index ["COMPONENT_ID"], name: "IX_B_PERF_SQL_1"
    t.index ["HIT_ID", "NN"], name: "IX_B_PERF_SQL_0", unique: true
  end

  create_table "b_perf_sql_backtrace", primary_key: ["SQL_ID", "NN"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SQL_ID", null: false
    t.integer "NN", null: false
    t.string "FILE_NAME", limit: 500
    t.integer "LINE_NO"
    t.string "CLASS_NAME", limit: 500
    t.string "FUNCTION_NAME", limit: 500
  end

  create_table "b_perf_tab_column_stat", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TABLE_NAME", limit: 50
    t.string "COLUMN_NAME", limit: 50
    t.float "TABLE_ROWS"
    t.float "COLUMN_ROWS"
    t.string "VALUE", limit: 100
    t.index ["TABLE_NAME", "COLUMN_NAME"], name: "ix_b_perf_tab_column_stat"
  end

  create_table "b_perf_tab_stat", primary_key: "TABLE_NAME", id: :string, limit: 50, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.float "TABLE_SIZE"
    t.float "TABLE_ROWS"
  end

  create_table "b_perf_test", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "REFERENCE_ID"
    t.string "NAME", limit: 200
    t.index ["REFERENCE_ID"], name: "IX_B_PERF_TEST_0"
  end

  create_table "b_posting", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "STATUS", limit: 1, default: "D", null: false
    t.string "VERSION", limit: 1
    t.datetime "DATE_SENT"
    t.text "SENT_BCC", size: :medium
    t.string "FROM_FIELD", null: false
    t.string "TO_FIELD"
    t.text "BCC_FIELD", size: :medium
    t.string "EMAIL_FILTER"
    t.string "SUBJECT", null: false
    t.string "BODY_TYPE", limit: 4, default: "text", null: false
    t.text "BODY", size: :medium, null: false
    t.string "DIRECT_SEND", limit: 1, default: "N", null: false
    t.string "CHARSET", limit: 50
    t.string "MSG_CHARSET"
    t.string "SUBSCR_FORMAT", limit: 4
    t.text "ERROR_EMAIL", size: :medium
    t.datetime "AUTO_SEND_TIME"
    t.text "BCC_TO_SEND", size: :medium
  end

  create_table "b_posting_email", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.string "STATUS", limit: 1, null: false
    t.string "EMAIL", null: false
    t.integer "SUBSCRIPTION_ID"
    t.integer "USER_ID"
    t.index ["POSTING_ID", "EMAIL"], name: "ix_posting_email_email"
    t.index ["POSTING_ID", "STATUS"], name: "ix_posting_email_status"
  end

  create_table "b_posting_file", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.integer "FILE_ID", null: false
    t.index ["POSTING_ID", "FILE_ID"], name: "UK_POSTING_POSTING_FILE", unique: true
  end

  create_table "b_posting_group", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.integer "GROUP_ID", null: false
    t.index ["POSTING_ID", "GROUP_ID"], name: "UK_POSTING_POSTING_GROUP", unique: true
  end

  create_table "b_posting_rubric", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.integer "LIST_RUBRIC_ID", null: false
    t.index ["POSTING_ID", "LIST_RUBRIC_ID"], name: "UK_POSTING_POSTING_RUBRIC", unique: true
  end

  create_table "b_pull_channel", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "CHANNEL_TYPE", limit: 50
    t.string "CHANNEL_ID", limit: 50, null: false
    t.integer "LAST_ID"
    t.datetime "DATE_CREATE", null: false
    t.index ["CHANNEL_ID"], name: "IX_PULL_CN_CID"
    t.index ["DATE_CREATE"], name: "IX_PULL_CN_D"
    t.index ["USER_ID", "CHANNEL_TYPE"], name: "IX_PULL_CN_UID", unique: true
  end

  create_table "b_pull_push", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "DEVICE_TYPE", limit: 50
    t.string "APP_ID", limit: 50
    t.string "UNIQUE_HASH", limit: 50
    t.string "DEVICE_ID"
    t.string "DEVICE_NAME", limit: 50
    t.string "DEVICE_TOKEN", null: false
    t.datetime "DATE_CREATE", null: false
    t.datetime "DATE_AUTH"
    t.index ["UNIQUE_HASH"], name: "IX_PULL_PSH_UH"
    t.index ["USER_ID"], name: "IX_PULL_PSH_UID"
  end

  create_table "b_pull_push_queue", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "TAG"
    t.string "SUB_TAG"
    t.text "PARAMS"
    t.integer "BADGE"
    t.datetime "DATE_CREATE"
    t.string "APP_ID", limit: 50
    t.text "MESSAGE"
    t.text "ADVANCED_PARAMS"
    t.index ["APP_ID"], name: "IX_PULL_PSHQ_AID"
    t.index ["DATE_CREATE"], name: "IX_PULL_PSHQ_DC"
    t.index ["USER_ID", "SUB_TAG"], name: "IX_PULL_PSHQ_UST"
    t.index ["USER_ID", "TAG"], name: "IX_PULL_PSHQ_UT"
    t.index ["USER_ID"], name: "IX_PULL_PSHQ_UID"
  end

  create_table "b_pull_stack", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CHANNEL_ID", limit: 50, null: false
    t.text "MESSAGE", null: false
    t.datetime "DATE_CREATE", null: false
    t.index ["CHANNEL_ID"], name: "IX_PULL_STACK_CID"
    t.index ["DATE_CREATE"], name: "IX_PULL_STACK_D"
  end

  create_table "b_pull_watch", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "CHANNEL_ID", limit: 50, null: false
    t.string "TAG", null: false
    t.datetime "DATE_CREATE", null: false
    t.index ["DATE_CREATE"], name: "IX_PULL_W_D"
    t.index ["TAG"], name: "IX_PULL_W_T"
    t.index ["USER_ID", "TAG"], name: "IX_PULL_W_UT"
  end

  create_table "b_rating", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, null: false
    t.string "NAME", limit: 512, null: false
    t.string "ENTITY_ID", limit: 50, null: false
    t.string "CALCULATION_METHOD", limit: 3, default: "SUM", null: false
    t.datetime "CREATED"
    t.datetime "LAST_MODIFIED"
    t.datetime "LAST_CALCULATED"
    t.string "POSITION", limit: 1, default: "N"
    t.string "AUTHORITY", limit: 1, default: "N"
    t.string "CALCULATED", limit: 1, default: "N", null: false
    t.text "CONFIGS"
  end

  create_table "b_rating_component", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RATING_ID", null: false
    t.string "ACTIVE", limit: 1, default: "N", null: false
    t.string "ENTITY_ID", limit: 50, null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.string "RATING_TYPE", limit: 50, null: false
    t.string "NAME", limit: 50, null: false
    t.string "COMPLEX_NAME", limit: 200, null: false
    t.string "CLASS", null: false
    t.string "CALC_METHOD", null: false
    t.string "EXCEPTION_METHOD"
    t.datetime "LAST_MODIFIED"
    t.datetime "LAST_CALCULATED"
    t.datetime "NEXT_CALCULATION"
    t.integer "REFRESH_INTERVAL", null: false
    t.text "CONFIG"
    t.index ["RATING_ID", "ACTIVE", "NEXT_CALCULATION"], name: "IX_RATING_ID_1"
  end

  create_table "b_rating_component_results", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RATING_ID", null: false
    t.string "ENTITY_TYPE_ID", limit: 50, null: false
    t.integer "ENTITY_ID", null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.string "RATING_TYPE", limit: 50, null: false
    t.string "NAME", limit: 50, null: false
    t.string "COMPLEX_NAME", limit: 200, null: false
    t.decimal "CURRENT_VALUE", precision: 18, scale: 4
    t.index ["COMPLEX_NAME"], name: "IX_COMPLEX_NAME"
    t.index ["ENTITY_TYPE_ID"], name: "IX_ENTITY_TYPE_ID"
    t.index ["RATING_ID", "COMPLEX_NAME"], name: "IX_RATING_ID_2"
  end

  create_table "b_rating_prepare", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ID"
  end

  create_table "b_rating_results", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RATING_ID", null: false
    t.string "ENTITY_TYPE_ID", limit: 50, null: false
    t.integer "ENTITY_ID", null: false
    t.decimal "CURRENT_VALUE", precision: 18, scale: 4
    t.decimal "PREVIOUS_VALUE", precision: 18, scale: 4
    t.integer "CURRENT_POSITION", default: 0
    t.integer "PREVIOUS_POSITION", default: 0
    t.index ["RATING_ID", "ENTITY_ID"], name: "IX_RATING_4"
    t.index ["RATING_ID", "ENTITY_TYPE_ID", "ENTITY_ID"], name: "IX_RATING_3"
  end

  create_table "b_rating_rule", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, default: "N", null: false
    t.string "NAME", limit: 256, null: false
    t.string "ENTITY_TYPE_ID", limit: 50, null: false
    t.string "CONDITION_NAME", limit: 200, null: false
    t.string "CONDITION_MODULE", limit: 50
    t.string "CONDITION_CLASS", null: false
    t.string "CONDITION_METHOD", null: false
    t.text "CONDITION_CONFIG"
    t.string "ACTION_NAME", limit: 200, null: false
    t.text "ACTION_CONFIG"
    t.string "ACTIVATE", limit: 1, default: "N", null: false
    t.string "ACTIVATE_CLASS", null: false
    t.string "ACTIVATE_METHOD", null: false
    t.string "DEACTIVATE", limit: 1, default: "N", null: false
    t.string "DEACTIVATE_CLASS", null: false
    t.string "DEACTIVATE_METHOD", null: false
    t.datetime "CREATED"
    t.datetime "LAST_MODIFIED"
    t.datetime "LAST_APPLIED"
  end

  create_table "b_rating_rule_vetting", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RULE_ID", null: false
    t.string "ENTITY_TYPE_ID", limit: 50, null: false
    t.integer "ENTITY_ID", null: false
    t.string "ACTIVATE", limit: 1, default: "N", null: false
    t.string "APPLIED", limit: 1, default: "N", null: false
    t.index ["RULE_ID", "ENTITY_TYPE_ID", "ENTITY_ID"], name: "RULE_ID"
  end

  create_table "b_rating_user", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RATING_ID", null: false
    t.integer "ENTITY_ID", null: false
    t.decimal "BONUS", precision: 18, scale: 4, default: "0.0"
    t.decimal "VOTE_WEIGHT", precision: 18, scale: 4, default: "0.0"
    t.integer "VOTE_COUNT", default: 0
    t.index ["ENTITY_ID"], name: "IX_B_RAT_USER_2"
    t.index ["RATING_ID", "ENTITY_ID"], name: "RATING_ID"
  end

  create_table "b_rating_vote", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RATING_VOTING_ID", null: false
    t.string "ENTITY_TYPE_ID", limit: 50, null: false
    t.integer "ENTITY_ID", null: false
    t.integer "OWNER_ID", null: false
    t.decimal "VALUE", precision: 18, scale: 4, null: false
    t.string "ACTIVE", limit: 1, null: false
    t.datetime "CREATED", null: false
    t.integer "USER_ID", null: false
    t.string "USER_IP", limit: 64, null: false
    t.index ["ACTIVE"], name: "IX_RAT_VOTE_ID_6"
    t.index ["CREATED", "USER_ID"], name: "IX_RAT_VOTE_ID_9"
    t.index ["CREATED", "VALUE"], name: "IX_RAT_VOTE_ID_5"
    t.index ["ENTITY_TYPE_ID", "CREATED"], name: "IX_RAT_VOTE_ID_8"
    t.index ["ENTITY_TYPE_ID", "ENTITY_ID", "USER_ID"], name: "IX_RAT_VOTE_ID_2"
    t.index ["OWNER_ID", "CREATED"], name: "IX_RAT_VOTE_ID_3"
    t.index ["RATING_VOTING_ID", "CREATED"], name: "IX_RAT_VOTE_ID_7"
    t.index ["RATING_VOTING_ID", "USER_ID"], name: "IX_RAT_VOTE_ID"
    t.index ["USER_ID"], name: "IX_RAT_VOTE_ID_4"
  end

  create_table "b_rating_vote_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.string "TYPE", limit: 1, null: false
    t.index ["GROUP_ID", "TYPE"], name: "RATING_ID"
  end

  create_table "b_rating_voting", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ENTITY_TYPE_ID", limit: 50, null: false
    t.integer "ENTITY_ID", null: false
    t.integer "OWNER_ID", null: false
    t.string "ACTIVE", limit: 1, null: false
    t.datetime "CREATED"
    t.datetime "LAST_CALCULATED"
    t.decimal "TOTAL_VALUE", precision: 18, scale: 4, null: false
    t.integer "TOTAL_VOTES", null: false
    t.integer "TOTAL_POSITIVE_VOTES", null: false
    t.integer "TOTAL_NEGATIVE_VOTES", null: false
    t.index ["ENTITY_TYPE_ID", "ENTITY_ID", "ACTIVE"], name: "IX_ENTITY_TYPE_ID_2"
    t.index ["TOTAL_VALUE"], name: "IX_ENTITY_TYPE_ID_4"
  end

  create_table "b_rating_voting_prepare", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RATING_VOTING_ID", null: false
    t.decimal "TOTAL_VALUE", precision: 18, scale: 4, null: false
    t.integer "TOTAL_VOTES", null: false
    t.integer "TOTAL_POSITIVE_VOTES", null: false
    t.integer "TOTAL_NEGATIVE_VOTES", null: false
    t.index ["RATING_VOTING_ID"], name: "IX_RATING_VOTING_ID"
  end

  create_table "b_rating_weight", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.decimal "RATING_FROM", precision: 18, scale: 4, null: false
    t.decimal "RATING_TO", precision: 18, scale: 4, null: false
    t.decimal "WEIGHT", precision: 18, scale: 4, default: "0.0"
    t.integer "COUNT", default: 0
  end

  create_table "b_report", primary_key: "ID", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "OWNER_ID", limit: 20
    t.string "TITLE", null: false
    t.text "DESCRIPTION"
    t.datetime "CREATED_DATE", null: false
    t.integer "CREATED_BY", null: false, unsigned: true
    t.text "SETTINGS"
    t.integer "MARK_DEFAULT", limit: 2, unsigned: true
    t.index ["OWNER_ID"], name: "OWNER_ID"
  end

  create_table "b_report_sharing", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "REPORT_ID", default: 0, null: false
    t.string "ENTITY", limit: 50, null: false
    t.string "RIGHTS", limit: 50, null: false
    t.index ["ENTITY"], name: "IX_ENTITY"
    t.index ["REPORT_ID"], name: "IX_REPORT_ID"
  end

  create_table "b_sale_affiliate", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.integer "USER_ID", null: false
    t.integer "AFFILIATE_ID"
    t.integer "PLAN_ID", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "DATE_CREATE", null: false
    t.decimal "PAID_SUM", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "APPROVED_SUM", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "PENDING_SUM", precision: 18, scale: 4, default: "0.0", null: false
    t.integer "ITEMS_NUMBER", default: 0, null: false
    t.decimal "ITEMS_SUM", precision: 18, scale: 4, default: "0.0", null: false
    t.datetime "LAST_CALCULATE"
    t.string "AFF_SITE", limit: 200
    t.text "AFF_DESCRIPTION"
    t.string "FIX_PLAN", limit: 1, default: "N", null: false
    t.index ["AFFILIATE_ID"], name: "IX_SAA_AFFILIATE_ID"
    t.index ["USER_ID", "SITE_ID"], name: "IX_SAA_USER_ID", unique: true
  end

  create_table "b_sale_affiliate_plan", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.string "NAME", limit: 250, null: false
    t.text "DESCRIPTION"
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.decimal "BASE_RATE", precision: 18, scale: 4, default: "0.0", null: false
    t.string "BASE_RATE_TYPE", limit: 1, default: "P", null: false
    t.string "BASE_RATE_CURRENCY", limit: 3
    t.decimal "MIN_PAY", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "MIN_PLAN_VALUE", precision: 18, scale: 4
    t.string "VALUE_CURRENCY", limit: 3
  end

  create_table "b_sale_affiliate_plan_section", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PLAN_ID", null: false
    t.string "MODULE_ID", limit: 50, default: "catalog", null: false
    t.string "SECTION_ID", null: false
    t.decimal "RATE", precision: 18, scale: 4, default: "0.0", null: false
    t.string "RATE_TYPE", limit: 1, default: "P", null: false
    t.string "RATE_CURRENCY", limit: 3
    t.index ["PLAN_ID", "MODULE_ID", "SECTION_ID"], name: "IX_SAP_PLAN_ID", unique: true
  end

  create_table "b_sale_affiliate_tier", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.decimal "RATE1", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "RATE2", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "RATE3", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "RATE4", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "RATE5", precision: 18, scale: 4, default: "0.0", null: false
    t.index ["SITE_ID"], name: "IX_SAT_SITE_ID", unique: true
  end

  create_table "b_sale_affiliate_transact", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "AFFILIATE_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "TRANSACT_DATE", null: false
    t.decimal "AMOUNT", precision: 18, scale: 4, null: false
    t.string "CURRENCY", limit: 3, null: false
    t.string "DEBIT", limit: 1, default: "N", null: false
    t.string "DESCRIPTION", limit: 100, null: false
    t.integer "EMPLOYEE_ID"
    t.index ["AFFILIATE_ID"], name: "IX_SAT_AFFILIATE_ID"
  end

  create_table "b_sale_auxiliary", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "ITEM", null: false
    t.string "ITEM_MD5", limit: 32, null: false
    t.integer "USER_ID", null: false
    t.datetime "DATE_INSERT", null: false
    t.index ["USER_ID", "ITEM_MD5"], name: "IX_STT_USER_ITEM", unique: true
  end

  create_table "b_sale_basket", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FUSER_ID", null: false
    t.integer "ORDER_ID"
    t.integer "PRODUCT_ID", null: false
    t.integer "PRODUCT_PRICE_ID"
    t.decimal "PRICE", precision: 18, scale: 4, default: "0.0", null: false
    t.string "CURRENCY", limit: 3, null: false
    t.decimal "BASE_PRICE", precision: 18, scale: 4
    t.string "VAT_INCLUDED", limit: 1, default: "Y", null: false
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_UPDATE", null: false
    t.float "WEIGHT", limit: 53
    t.float "QUANTITY", limit: 53, default: 0.0, null: false
    t.string "LID", limit: 2, null: false
    t.string "DELAY", limit: 1, default: "N", null: false
    t.string "NAME", null: false
    t.string "CAN_BUY", limit: 1, default: "Y", null: false
    t.string "MODULE", limit: 100
    t.string "CALLBACK_FUNC", limit: 100
    t.string "NOTES", limit: 250
    t.string "ORDER_CALLBACK_FUNC", limit: 100
    t.string "DETAIL_PAGE_URL", limit: 250
    t.decimal "DISCOUNT_PRICE", precision: 18, scale: 4, default: "0.0", null: false
    t.string "CANCEL_CALLBACK_FUNC", limit: 100
    t.string "PAY_CALLBACK_FUNC", limit: 100
    t.string "PRODUCT_PROVIDER_CLASS", limit: 100
    t.string "CATALOG_XML_ID", limit: 100
    t.string "PRODUCT_XML_ID", limit: 100
    t.string "DISCOUNT_NAME"
    t.string "DISCOUNT_VALUE", limit: 32
    t.string "DISCOUNT_COUPON", limit: 32
    t.decimal "VAT_RATE", precision: 18, scale: 4, default: "0.0"
    t.string "SUBSCRIBE", limit: 1, default: "N", null: false
    t.string "DEDUCTED", limit: 1, default: "N", null: false
    t.string "RESERVED", limit: 1, default: "N", null: false
    t.string "BARCODE_MULTI", limit: 1, default: "N", null: false
    t.float "RESERVE_QUANTITY", limit: 53
    t.string "CUSTOM_PRICE", limit: 1, default: "N", null: false
    t.string "DIMENSIONS"
    t.integer "TYPE"
    t.integer "SET_PARENT_ID"
    t.integer "MEASURE_CODE"
    t.string "MEASURE_NAME", limit: 50
    t.string "RECOMMENDATION", limit: 40
    t.index ["DATE_INSERT"], name: "IXS_BASKET_DATE_INSERT"
    t.index ["FUSER_ID"], name: "IXS_BASKET_USER_ID"
    t.index ["LID"], name: "IXS_BASKET_LID"
    t.index ["ORDER_ID"], name: "IXS_BASKET_ORDER_ID"
    t.index ["PRODUCT_ID"], name: "IXS_BASKET_PRODUCT_ID"
    t.index ["PRODUCT_PRICE_ID"], name: "IXS_BASKET_PRODUCT_PRICE_ID"
    t.index ["PRODUCT_XML_ID", "CATALOG_XML_ID"], name: "IXS_SBAS_XML_ID"
  end

  create_table "b_sale_basket_props", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BASKET_ID", null: false
    t.string "NAME", null: false
    t.string "VALUE"
    t.string "CODE"
    t.integer "SORT", default: 100, null: false
    t.index ["BASKET_ID"], name: "IXS_BASKET_PROPS_BASKET"
    t.index ["CODE"], name: "IXS_BASKET_PROPS_CODE"
  end

  create_table "b_sale_bizval", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CODE_ID", null: false
    t.integer "PERSON_TYPE_ID", null: false
    t.string "ENTITY", limit: 50, null: false
    t.string "ITEM", null: false
    t.index ["CODE_ID", "PERSON_TYPE_ID"], name: "IX_BSB_SECONDARY", unique: true
  end

  create_table "b_sale_bizval_code", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 50, null: false
    t.string "DOMAIN", limit: 1, null: false
    t.integer "GROUP_ID"
    t.integer "SORT", default: 100, null: false
    t.index ["NAME"], name: "IX_BSBC_NAME", unique: true
  end

  create_table "b_sale_bizval_codeparent", primary_key: ["CODE_ID", "PARENT_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CODE_ID", null: false
    t.integer "PARENT_ID", null: false
  end

  create_table "b_sale_bizval_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 50, null: false
    t.integer "SORT", default: 100, null: false
    t.index ["NAME"], name: "IX_BSBG_NAME", unique: true
  end

  create_table "b_sale_bizval_parent", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 50, null: false
    t.string "LANG_SRC"
    t.index ["NAME"], name: "IX_BSBP_NAME", unique: true
  end

  create_table "b_sale_bizval_persondomain", primary_key: ["PERSON_TYPE_ID", "DOMAIN"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PERSON_TYPE_ID", null: false
    t.string "DOMAIN", limit: 1, null: false
  end

  create_table "b_sale_company", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 128, null: false
    t.string "LOCATION_ID", limit: 128, null: false
    t.string "CODE", limit: 45
    t.string "XML_ID", limit: 45
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "DATE_CREATE"
    t.datetime "DATE_MODIFY"
    t.integer "CREATED_BY"
    t.integer "MODIFIED_BY"
    t.string "ADDRESS"
  end

  create_table "b_sale_delivery2location", primary_key: ["DELIVERY_ID", "LOCATION_CODE", "LOCATION_TYPE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DELIVERY_ID", null: false
    t.string "LOCATION_CODE", limit: 100, null: false
    t.string "LOCATION_TYPE", limit: 1, default: "L", null: false
  end

  create_table "b_sale_delivery2paysystem", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DELIVERY_ID", null: false
    t.string "LINK_DIRECTION", limit: 1, null: false
    t.integer "PAYSYSTEM_ID", null: false
    t.index ["DELIVERY_ID"], name: "IX_DELIVERY"
    t.index ["LINK_DIRECTION"], name: "LINK_DIRECTION"
    t.index ["PAYSYSTEM_ID"], name: "IX_PAYSYSTEM"
  end

  create_table "b_sale_delivery_es", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 50
    t.string "NAME", null: false
    t.string "DESCRIPTION"
    t.string "CLASS_NAME", null: false
    t.text "PARAMS"
    t.string "RIGHTS", limit: 3, null: false
    t.integer "DELIVERY_ID", null: false
    t.string "INIT_VALUE"
    t.string "ACTIVE", limit: 1, null: false
    t.integer "SORT", default: 100
    t.index ["DELIVERY_ID"], name: "IX_BSD_ES_DELIVERY_ID"
  end

  create_table "b_sale_delivery_rstr", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DELIVERY_ID", null: false
    t.integer "SORT", default: 100
    t.string "CLASS_NAME", null: false
    t.text "PARAMS"
    t.index ["DELIVERY_ID"], name: "IX_BSDR_DELIVERY_ID"
  end

  create_table "b_sale_delivery_srv", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 50
    t.integer "PARENT_ID"
    t.string "NAME", null: false
    t.string "ACTIVE", limit: 1, null: false
    t.string "DESCRIPTION"
    t.integer "SORT", null: false
    t.integer "LOGOTIP"
    t.text "CONFIG", size: :long
    t.string "CLASS_NAME", null: false
    t.string "CURRENCY", limit: 3, null: false
    t.string "TRACKING_PARAMS"
    t.index ["CODE"], name: "IX_BSD_SRV_CODE"
    t.index ["PARENT_ID"], name: "IX_BSD_SRV_PARENT_ID"
  end

  create_table "b_sale_discount", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "XML_ID"
    t.string "LID", limit: 2, null: false
    t.string "NAME"
    t.decimal "PRICE_FROM", precision: 18, scale: 2
    t.decimal "PRICE_TO", precision: 18, scale: 2
    t.string "CURRENCY", limit: 3
    t.decimal "DISCOUNT_VALUE", precision: 18, scale: 2, null: false
    t.string "DISCOUNT_TYPE", limit: 1, default: "P", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 100, null: false
    t.datetime "ACTIVE_FROM"
    t.datetime "ACTIVE_TO"
    t.datetime "TIMESTAMP_X"
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.integer "PRIORITY", default: 1, null: false
    t.string "LAST_DISCOUNT", limit: 1, default: "Y", null: false
    t.integer "VERSION", default: 1, null: false
    t.text "CONDITIONS", size: :medium
    t.text "UNPACK", size: :medium
    t.text "ACTIONS", size: :medium
    t.text "APPLICATION", size: :medium
    t.string "USE_COUPONS", limit: 1, default: "N", null: false
    t.string "EXECUTE_MODULE", limit: 50, default: "all", null: false
    t.index ["ACTIVE_FROM", "ACTIVE_TO"], name: "IX_SSD_ACTIVE_DATE"
    t.index ["LID"], name: "IXS_DISCOUNT_LID"
  end

  create_table "b_sale_discount_coupon", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "ACTIVE_FROM"
    t.datetime "ACTIVE_TO"
    t.string "COUPON", limit: 32, null: false
    t.integer "TYPE", default: 0, null: false
    t.integer "MAX_USE", default: 0, null: false
    t.integer "USE_COUNT", default: 0, null: false
    t.integer "USER_ID", default: 0, null: false
    t.datetime "DATE_APPLY"
    t.datetime "TIMESTAMP_X"
    t.integer "MODIFIED_BY"
    t.datetime "DATE_CREATE"
    t.integer "CREATED_BY"
    t.text "DESCRIPTION"
  end

  create_table "b_sale_discount_entities", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.string "ENTITY", null: false
    t.string "FIELD_ENTITY", null: false
    t.string "FIELD_TABLE", null: false
    t.index ["DISCOUNT_ID"], name: "IX_SALE_DSC_ENT_DISCOUNT_ID"
  end

  create_table "b_sale_discount_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "ACTIVE", limit: 1
    t.integer "GROUP_ID", null: false
    t.index ["DISCOUNT_ID", "GROUP_ID"], name: "IX_S_DISGRP", unique: true
    t.index ["DISCOUNT_ID"], name: "IX_S_DISGRP_D"
    t.index ["GROUP_ID", "DISCOUNT_ID"], name: "IX_S_DISGRP_G", unique: true
  end

  create_table "b_sale_discount_module", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "DISCOUNT_ID", null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.index ["DISCOUNT_ID"], name: "IX_SALE_DSC_MOD"
  end

  create_table "b_sale_export", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PERSON_TYPE_ID", null: false
    t.text "VARS"
  end

  create_table "b_sale_fuser", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_UPDATE", null: false
    t.integer "USER_ID"
    t.string "CODE", limit: 32
    t.index ["CODE"], name: "IX_CODE"
    t.index ["USER_ID"], name: "IX_USER_ID"
  end

  create_table "b_sale_lang", primary_key: "LID", id: :string, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CURRENCY", limit: 3, null: false
  end

  create_table "b_sale_loc_2site", primary_key: ["SITE_ID", "LOCATION_ID", "LOCATION_TYPE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "LOCATION_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.string "LOCATION_TYPE", limit: 1, default: "L", null: false
  end

  create_table "b_sale_loc_def2site", primary_key: ["LOCATION_CODE", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LOCATION_CODE", limit: 100, null: false
    t.string "SITE_ID", limit: 2, null: false
    t.integer "SORT", default: 100
  end

  create_table "b_sale_loc_ext", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SERVICE_ID", null: false
    t.integer "LOCATION_ID", null: false
    t.string "XML_ID", limit: 100, null: false
    t.index ["LOCATION_ID", "SERVICE_ID"], name: "IX_B_SALE_LOC_EXT_LID_SID"
  end

  create_table "b_sale_loc_ext_srv", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 100, null: false
  end

  create_table "b_sale_loc_name", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LANGUAGE_ID", limit: 2, null: false
    t.integer "LOCATION_ID", null: false
    t.string "NAME", limit: 100, null: false
    t.string "NAME_UPPER", limit: 100, null: false
    t.string "SHORT_NAME", limit: 100
    t.index ["LOCATION_ID", "LANGUAGE_ID"], name: "IX_SALE_L_NAME_LID_LID"
    t.index ["NAME_UPPER"], name: "IX_SALE_L_NAME_NAME_UPPER"
  end

  create_table "b_sale_loc_type", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 30, null: false
    t.integer "SORT", default: 100
    t.integer "DISPLAY_SORT", default: 100
  end

  create_table "b_sale_loc_type_name", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LANGUAGE_ID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.integer "TYPE_ID", null: false
    t.index ["TYPE_ID", "LANGUAGE_ID"], name: "IX_SALE_L_TYPE_NAME_TID_LID"
  end

  create_table "b_sale_location", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SORT", default: 100, null: false
    t.string "CODE", limit: 100, null: false
    t.integer "LEFT_MARGIN"
    t.integer "RIGHT_MARGIN"
    t.integer "PARENT_ID", default: 0
    t.integer "DEPTH_LEVEL", default: 1
    t.integer "TYPE_ID"
    t.decimal "LATITUDE", precision: 8, scale: 6
    t.decimal "LONGITUDE", precision: 9, scale: 6
    t.integer "COUNTRY_ID"
    t.integer "REGION_ID"
    t.integer "CITY_ID"
    t.string "LOC_DEFAULT", limit: 1, default: "N", null: false
    t.index ["CITY_ID"], name: "IXS_LOCATION_CITY_ID"
    t.index ["CODE"], name: "IX_SALE_LOCATION_CODE", unique: true
    t.index ["COUNTRY_ID"], name: "IXS_LOCATION_COUNTRY_ID"
    t.index ["DEPTH_LEVEL"], name: "IX_SALE_LOCATION_DL"
    t.index ["LEFT_MARGIN", "RIGHT_MARGIN"], name: "IX_SALE_LOCATION_MARGINS"
    t.index ["PARENT_ID"], name: "IX_SALE_LOCATION_PARENT"
    t.index ["REGION_ID"], name: "IXS_LOCATION_REGION_ID"
    t.index ["RIGHT_MARGIN", "LEFT_MARGIN"], name: "IX_SALE_LOCATION_MARGINS_REV"
    t.index ["TYPE_ID"], name: "IX_SALE_LOCATION_TYPE"
  end

  create_table "b_sale_location2location_group", primary_key: ["LOCATION_ID", "LOCATION_GROUP_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "LOCATION_ID", null: false
    t.integer "LOCATION_GROUP_ID", null: false
  end

  create_table "b_sale_location_city", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100, null: false
    t.string "SHORT_NAME", limit: 100
    t.integer "REGION_ID"
    t.index ["REGION_ID"], name: "IXS_LOCAT_REGION_ID"
  end

  create_table "b_sale_location_city_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CITY_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.string "SHORT_NAME", limit: 100
    t.index ["CITY_ID", "LID"], name: "IXS_LOCAT_CITY_LID", unique: true
    t.index ["NAME"], name: "IX_NAME"
  end

  create_table "b_sale_location_country", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100, null: false
    t.string "SHORT_NAME", limit: 100
    t.index ["NAME"], name: "IX_NAME"
  end

  create_table "b_sale_location_country_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "COUNTRY_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.string "SHORT_NAME", limit: 100
    t.index ["COUNTRY_ID", "LID"], name: "IXS_LOCAT_CNTR_LID", unique: true
  end

  create_table "b_sale_location_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 100, null: false
    t.integer "SORT", default: 100, null: false
    t.index ["CODE"], name: "IX_SALE_LOCATION_GROUP_CODE", unique: true
  end

  create_table "b_sale_location_group_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "LOCATION_GROUP_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 250, null: false
    t.index ["LOCATION_GROUP_ID", "LID"], name: "IX_LOCATION_GROUP_LID", unique: true
  end

  create_table "b_sale_location_region", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.string "SHORT_NAME", limit: 100
  end

  create_table "b_sale_location_region_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "REGION_ID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.string "SHORT_NAME", limit: 100
    t.index ["NAME"], name: "IXS_NAME"
    t.index ["REGION_ID", "LID"], name: "IXS_LOCAT_REGION_LID", unique: true
  end

  create_table "b_sale_location_zip", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "LOCATION_ID", default: 0, null: false
    t.string "ZIP", limit: 10, default: "", null: false
    t.index ["LOCATION_ID"], name: "IX_LOCATION_ID"
    t.index ["ZIP"], name: "IX_ZIP"
  end

  create_table "b_sale_order", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2, null: false
    t.integer "PERSON_TYPE_ID", null: false
    t.string "PAYED", limit: 1, default: "N", null: false
    t.datetime "DATE_PAYED"
    t.integer "EMP_PAYED_ID"
    t.string "CANCELED", limit: 1, default: "N", null: false
    t.datetime "DATE_CANCELED"
    t.integer "EMP_CANCELED_ID"
    t.string "REASON_CANCELED"
    t.string "STATUS_ID", limit: 2, null: false
    t.datetime "DATE_STATUS", null: false
    t.integer "EMP_STATUS_ID"
    t.decimal "PRICE_DELIVERY", precision: 18, scale: 4, default: "0.0", null: false
    t.decimal "PRICE_PAYMENT", precision: 18, scale: 4, default: "0.0", null: false
    t.string "ALLOW_DELIVERY", limit: 1, default: "N", null: false
    t.datetime "DATE_ALLOW_DELIVERY"
    t.integer "EMP_ALLOW_DELIVERY_ID"
    t.string "DEDUCTED", limit: 1, default: "N", null: false
    t.datetime "DATE_DEDUCTED"
    t.integer "EMP_DEDUCTED_ID"
    t.string "REASON_UNDO_DEDUCTED"
    t.string "MARKED", limit: 1, default: "N", null: false
    t.datetime "DATE_MARKED"
    t.integer "EMP_MARKED_ID"
    t.string "REASON_MARKED"
    t.string "RESERVED", limit: 1, default: "N", null: false
    t.decimal "PRICE", precision: 18, scale: 4, null: false
    t.string "CURRENCY", limit: 3, null: false
    t.decimal "DISCOUNT_VALUE", precision: 18, scale: 4, default: "0.0", null: false
    t.integer "USER_ID", null: false
    t.integer "PAY_SYSTEM_ID"
    t.string "DELIVERY_ID", limit: 50
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_UPDATE", null: false
    t.string "USER_DESCRIPTION", limit: 2000
    t.string "ADDITIONAL_INFO"
    t.string "PS_STATUS", limit: 1
    t.string "PS_STATUS_CODE", limit: 5
    t.string "PS_STATUS_DESCRIPTION", limit: 250
    t.string "PS_STATUS_MESSAGE", limit: 250
    t.decimal "PS_SUM", precision: 18, scale: 2
    t.string "PS_CURRENCY", limit: 3
    t.datetime "PS_RESPONSE_DATE"
    t.text "COMMENTS"
    t.decimal "TAX_VALUE", precision: 18, scale: 2, default: "0.0", null: false
    t.string "STAT_GID"
    t.decimal "SUM_PAID", precision: 18, scale: 2, default: "0.0", null: false
    t.integer "RECURRING_ID"
    t.string "PAY_VOUCHER_NUM", limit: 20
    t.date "PAY_VOUCHER_DATE"
    t.integer "LOCKED_BY"
    t.datetime "DATE_LOCK"
    t.string "RECOUNT_FLAG", limit: 1, default: "Y", null: false
    t.integer "AFFILIATE_ID"
    t.string "DELIVERY_DOC_NUM", limit: 20
    t.date "DELIVERY_DOC_DATE"
    t.string "UPDATED_1C", limit: 1, default: "N", null: false
    t.integer "STORE_ID"
    t.string "ORDER_TOPIC"
    t.integer "CREATED_BY"
    t.integer "RESPONSIBLE_ID"
    t.datetime "DATE_PAY_BEFORE"
    t.datetime "DATE_BILL"
    t.string "ACCOUNT_NUMBER", limit: 100
    t.string "TRACKING_NUMBER"
    t.string "XML_ID"
    t.string "ID_1C", limit: 15
    t.string "VERSION_1C", limit: 15
    t.integer "VERSION", default: 0, null: false
    t.string "EXTERNAL_ORDER", limit: 1, default: "N", null: false
    t.string "BX_USER_ID", limit: 32
    t.index ["ACCOUNT_NUMBER"], name: "IXS_ACCOUNT_NUMBER", unique: true
    t.index ["AFFILIATE_ID"], name: "IX_SOO_AFFILIATE_ID"
    t.index ["DATE_UPDATE"], name: "IXS_DATE_UPDATE"
    t.index ["ID_1C"], name: "IXS_ID_1C"
    t.index ["PAYED"], name: "IXS_ORDER_PAYED"
    t.index ["PERSON_TYPE_ID"], name: "IXS_ORDER_PERSON_TYPE_ID"
    t.index ["RECURRING_ID"], name: "IXS_ORDER_REC_ID"
    t.index ["STATUS_ID"], name: "IXS_ORDER_STATUS_ID"
    t.index ["UPDATED_1C"], name: "IXS_ORDER_UPDATED_1C"
    t.index ["USER_ID", "LID", "PAYED", "CANCELED"], name: "IXS_SALE_COUNT"
    t.index ["USER_ID"], name: "IXS_ORDER_USER_ID"
    t.index ["XML_ID"], name: "IXS_XML_ID"
  end

  create_table "b_sale_order_change", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.string "TYPE", null: false
    t.string "DATA", limit: 512
    t.datetime "DATE_CREATE", null: false
    t.datetime "DATE_MODIFY", null: false
    t.integer "USER_ID", null: false
    t.string "ENTITY", limit: 50
    t.integer "ENTITY_ID"
    t.index ["ORDER_ID"], name: "IXS_ORDER_ID_CHANGE"
    t.index ["TYPE"], name: "IXS_TYPE_CHANGE"
  end

  create_table "b_sale_order_coupons", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.integer "ORDER_DISCOUNT_ID", null: false
    t.string "COUPON", limit: 32, null: false
    t.integer "TYPE", null: false
    t.integer "COUPON_ID", null: false
    t.text "DATA"
    t.index ["ORDER_ID"], name: "IX_SALE_ORDER_CPN_ORDER"
  end

  create_table "b_sale_order_delivery", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_REQUEST"
    t.datetime "DATE_UPDATE"
    t.string "DELIVERY_LOCATION", limit: 50
    t.text "PARAMS"
    t.string "STATUS_ID", limit: 2, null: false
    t.decimal "PRICE_DELIVERY", precision: 18, scale: 4
    t.decimal "DISCOUNT_PRICE", precision: 18, scale: 4
    t.decimal "BASE_PRICE_DELIVERY", precision: 18, scale: 4
    t.string "CUSTOM_PRICE_DELIVERY", limit: 1
    t.string "ALLOW_DELIVERY", limit: 1, default: "N"
    t.datetime "DATE_ALLOW_DELIVERY"
    t.integer "EMP_ALLOW_DELIVERY_ID"
    t.string "DEDUCTED", limit: 1, default: "N"
    t.datetime "DATE_DEDUCTED"
    t.integer "EMP_DEDUCTED_ID"
    t.string "REASON_UNDO_DEDUCTED"
    t.string "RESERVED", limit: 1
    t.integer "DELIVERY_ID", null: false
    t.string "DELIVERY_DOC_NUM", limit: 20
    t.datetime "DELIVERY_DOC_DATE"
    t.string "TRACKING_NUMBER"
    t.string "XML_ID"
    t.string "DELIVERY_NAME", limit: 128
    t.string "CANCELED", limit: 1, default: "N"
    t.datetime "DATE_CANCELED"
    t.integer "EMP_CANCELED_ID"
    t.string "REASON_CANCELED", default: ""
    t.string "MARKED", limit: 1
    t.datetime "DATE_MARKED"
    t.integer "EMP_MARKED_ID"
    t.string "REASON_MARKED"
    t.string "CURRENCY", limit: 3
    t.string "SYSTEM", limit: 1, default: "N", null: false
    t.integer "RESPONSIBLE_ID"
    t.integer "EMP_RESPONSIBLE_ID"
    t.datetime "DATE_RESPONSIBLE_ID"
    t.text "COMMENTS"
    t.integer "COMPANY_ID"
    t.integer "TRACKING_STATUS"
    t.string "TRACKING_DESCRIPTION"
    t.datetime "TRACKING_LAST_CHECK"
    t.datetime "TRACKING_LAST_CHANGE"
    t.index ["ORDER_ID"], name: "IX_BSOD_ORDER_ID"
  end

  create_table "b_sale_order_delivery_es", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SHIPMENT_ID", null: false
    t.integer "EXTRA_SERVICE_ID", null: false
    t.string "VALUE"
    t.index ["EXTRA_SERVICE_ID"], name: "IX_BSOD_ES_EXTRA_SERVICE_ID"
    t.index ["SHIPMENT_ID"], name: "IX_BSOD_ES_SHIPMENT_ID"
  end

  create_table "b_sale_order_discount", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50, null: false
    t.integer "DISCOUNT_ID", null: false
    t.string "NAME", null: false
    t.string "DISCOUNT_HASH", limit: 32, null: false
    t.text "CONDITIONS", size: :medium
    t.text "UNPACK", size: :medium
    t.text "ACTIONS", size: :medium
    t.text "APPLICATION", size: :medium
    t.string "USE_COUPONS", limit: 1, null: false
    t.integer "SORT", null: false
    t.integer "PRIORITY", null: false
    t.string "LAST_DISCOUNT", limit: 1, null: false
    t.text "ACTIONS_DESCR", size: :medium
    t.index ["DISCOUNT_HASH"], name: "IX_SALE_ORDER_DSC_HASH"
  end

  create_table "b_sale_order_discount_data", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.integer "ENTITY_TYPE", null: false
    t.integer "ENTITY_ID", null: false
    t.string "ENTITY_VALUE"
    t.text "ENTITY_DATA", size: :medium, null: false
    t.index ["ORDER_ID", "ENTITY_TYPE"], name: "IX_SALE_DSC_DATA_CMX"
  end

  create_table "b_sale_order_dlv_basket", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_DELIVERY_ID", null: false
    t.integer "BASKET_ID", null: false
    t.datetime "DATE_INSERT", null: false
    t.decimal "QUANTITY", precision: 18, scale: 4, null: false
    t.decimal "RESERVED_QUANTITY", precision: 18, scale: 4, null: false
    t.index ["BASKET_ID"], name: "IX_S_O_DB_BASKET_ID"
    t.index ["ORDER_DELIVERY_ID"], name: "IX_BSODB_ORDER_DELIVERY_ID"
  end

  create_table "b_sale_order_flags2group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.string "ORDER_FLAG", limit: 1, null: false
    t.index ["GROUP_ID", "ORDER_FLAG"], name: "ix_sale_ordfla2group", unique: true
  end

  create_table "b_sale_order_history", primary_key: "ID", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "H_USER_ID", null: false, unsigned: true
    t.datetime "H_DATE_INSERT", null: false
    t.integer "H_ORDER_ID", null: false, unsigned: true
    t.string "H_CURRENCY", limit: 3, null: false
    t.integer "PERSON_TYPE_ID", unsigned: true
    t.string "PAYED", limit: 1
    t.datetime "DATE_PAYED"
    t.integer "EMP_PAYED_ID", unsigned: true
    t.string "CANCELED", limit: 1
    t.datetime "DATE_CANCELED"
    t.string "REASON_CANCELED"
    t.string "STATUS_ID", limit: 2, null: false
    t.datetime "DATE_STATUS"
    t.decimal "PRICE_DELIVERY", precision: 18, scale: 2
    t.string "ALLOW_DELIVERY", limit: 1
    t.datetime "DATE_ALLOW_DELIVERY"
    t.string "RESERVED", limit: 1
    t.string "DEDUCTED", limit: 1
    t.datetime "DATE_DEDUCTED"
    t.string "REASON_UNDO_DEDUCTED"
    t.string "MARKED", limit: 1
    t.datetime "DATE_MARKED"
    t.string "REASON_MARKED"
    t.decimal "PRICE", precision: 18, scale: 2
    t.string "CURRENCY", limit: 3
    t.decimal "DISCOUNT_VALUE", precision: 18, scale: 2
    t.integer "USER_ID", unsigned: true
    t.integer "PAY_SYSTEM_ID", unsigned: true
    t.string "DELIVERY_ID", limit: 50
    t.string "PS_STATUS", limit: 1
    t.string "PS_STATUS_CODE", limit: 5
    t.string "PS_STATUS_DESCRIPTION", limit: 250
    t.string "PS_STATUS_MESSAGE", limit: 250
    t.decimal "PS_SUM", precision: 18, scale: 2
    t.string "PS_CURRENCY", limit: 3
    t.datetime "PS_RESPONSE_DATE"
    t.decimal "TAX_VALUE", precision: 18, scale: 2
    t.string "STAT_GID"
    t.decimal "SUM_PAID", precision: 18, scale: 2
    t.string "PAY_VOUCHER_NUM", limit: 20
    t.date "PAY_VOUCHER_DATE"
    t.integer "AFFILIATE_ID", unsigned: true
    t.string "DELIVERY_DOC_NUM", limit: 20
    t.date "DELIVERY_DOC_DATE"
    t.index ["H_ORDER_ID"], name: "ixH_ORDER_ID"
  end

  create_table "b_sale_order_modules", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_DISCOUNT_ID", null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.index ["ORDER_DISCOUNT_ID"], name: "IX_SALE_ORDER_MDL_DSC"
  end

  create_table "b_sale_order_payment", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.string "PAID", limit: 1, default: "N", null: false
    t.datetime "DATE_PAID"
    t.integer "EMP_PAID_ID"
    t.integer "PAY_SYSTEM_ID", null: false
    t.string "PS_STATUS", limit: 1
    t.string "PS_STATUS_CODE", limit: 5
    t.string "PS_STATUS_DESCRIPTION", limit: 250
    t.string "PS_STATUS_MESSAGE", limit: 250
    t.decimal "PS_SUM", precision: 18, scale: 4
    t.string "PS_CURRENCY", limit: 3
    t.datetime "PS_RESPONSE_DATE"
    t.string "PAY_VOUCHER_NUM", limit: 20
    t.date "PAY_VOUCHER_DATE"
    t.datetime "DATE_PAY_BEFORE"
    t.datetime "DATE_BILL"
    t.string "XML_ID"
    t.decimal "SUM", precision: 18, scale: 4, null: false
    t.string "CURRENCY", limit: 3, null: false
    t.string "PAY_SYSTEM_NAME", limit: 128, null: false
    t.integer "RESPONSIBLE_ID"
    t.datetime "DATE_RESPONSIBLE_ID"
    t.integer "EMP_RESPONSIBLE_ID"
    t.text "COMMENTS"
    t.integer "COMPANY_ID"
    t.date "PAY_RETURN_DATE"
    t.integer "EMP_RETURN_ID"
    t.string "PAY_RETURN_NUM", limit: 20
    t.text "PAY_RETURN_COMMENT"
    t.string "IS_RETURN", limit: 1, default: "N", null: false
    t.index ["ORDER_ID"], name: "IX_BSOP_ORDER_ID"
  end

  create_table "b_sale_order_processing", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", default: 0
    t.string "PRODUCTS_ADDED", limit: 1, default: "N"
    t.string "PRODUCTS_REMOVED", limit: 1, default: "N"
  end

  create_table "b_sale_order_props", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PERSON_TYPE_ID", null: false
    t.string "NAME", null: false
    t.string "TYPE", limit: 20, null: false
    t.string "REQUIRED", limit: 1, default: "N", null: false
    t.string "DEFAULT_VALUE", limit: 500
    t.integer "SORT", default: 100, null: false
    t.string "USER_PROPS", limit: 1, default: "N", null: false
    t.string "IS_LOCATION", limit: 1, default: "N", null: false
    t.integer "PROPS_GROUP_ID", null: false
    t.string "DESCRIPTION"
    t.string "IS_EMAIL", limit: 1, default: "N", null: false
    t.string "IS_PROFILE_NAME", limit: 1, default: "N", null: false
    t.string "IS_PAYER", limit: 1, default: "N", null: false
    t.string "IS_LOCATION4TAX", limit: 1, default: "N", null: false
    t.string "IS_FILTERED", limit: 1, default: "N", null: false
    t.string "CODE", limit: 50
    t.string "IS_ZIP", limit: 1, default: "N", null: false
    t.string "IS_PHONE", limit: 1, default: "N", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "UTIL", limit: 1, default: "N", null: false
    t.integer "INPUT_FIELD_LOCATION", default: 0, null: false
    t.string "MULTIPLE", limit: 1, default: "N", null: false
    t.string "IS_ADDRESS", limit: 1, default: "N", null: false
    t.string "SETTINGS", limit: 500
    t.index ["CODE"], name: "IXS_CODE_OPP"
    t.index ["PERSON_TYPE_ID"], name: "IXS_ORDER_PROPS_PERSON_TYPE_ID"
  end

  create_table "b_sale_order_props_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PERSON_TYPE_ID", null: false
    t.string "NAME", null: false
    t.integer "SORT", default: 100, null: false
    t.index ["PERSON_TYPE_ID"], name: "IXS_ORDER_PROPS_GROUP_PERSON_TYPE_ID"
  end

  create_table "b_sale_order_props_relation", primary_key: ["PROPERTY_ID", "ENTITY_ID", "ENTITY_TYPE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PROPERTY_ID", null: false
    t.string "ENTITY_ID", limit: 35, null: false
    t.string "ENTITY_TYPE", limit: 1, null: false
    t.index ["ENTITY_ID"], name: "IX_ENTITY_ID"
    t.index ["PROPERTY_ID"], name: "IX_PROPERTY"
  end

  create_table "b_sale_order_props_value", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.integer "ORDER_PROPS_ID"
    t.string "NAME", null: false
    t.string "VALUE", limit: 500
    t.string "CODE", limit: 50
    t.index ["ORDER_ID", "ORDER_PROPS_ID"], name: "IX_SOPV_ORD_PROP_UNI", unique: true
  end

  create_table "b_sale_order_props_variant", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_PROPS_ID", null: false
    t.string "NAME", null: false
    t.string "VALUE"
    t.integer "SORT", default: 100, null: false
    t.string "DESCRIPTION"
    t.index ["ORDER_PROPS_ID"], name: "IXS_ORDER_PROPS_VARIANT_ORDER_PROPS_ID"
  end

  create_table "b_sale_order_rules", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50, null: false
    t.integer "ORDER_DISCOUNT_ID", null: false
    t.integer "ORDER_ID", null: false
    t.integer "ENTITY_TYPE", null: false
    t.integer "ENTITY_ID", null: false
    t.string "ENTITY_VALUE"
    t.integer "COUPON_ID", null: false
    t.string "APPLY", limit: 1, null: false
    t.index ["ORDER_ID"], name: "IX_SALE_ORDER_RULES_ORD"
  end

  create_table "b_sale_order_rules_descr", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50, null: false
    t.integer "ORDER_DISCOUNT_ID", null: false
    t.integer "ORDER_ID", null: false
    t.integer "RULE_ID", null: false
    t.text "DESCR", null: false
    t.index ["ORDER_ID"], name: "IX_SALE_ORDER_RULES_DS_ORD"
  end

  create_table "b_sale_order_tax", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.string "TAX_NAME", null: false
    t.decimal "VALUE", precision: 18, scale: 4
    t.decimal "VALUE_MONEY", precision: 18, scale: 4, null: false
    t.integer "APPLY_ORDER", null: false
    t.string "CODE", limit: 50
    t.string "IS_PERCENT", limit: 1, default: "Y", null: false
    t.string "IS_IN_PRICE", limit: 1, default: "N", null: false
    t.index ["ORDER_ID"], name: "ixs_sot_order_id"
  end

  create_table "b_sale_pay_system", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2
    t.string "CURRENCY", limit: 3
    t.string "NAME", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 100, null: false
    t.string "DESCRIPTION", limit: 2000
    t.index ["LID"], name: "IXS_PAY_SYSTEM_LID"
  end

  create_table "b_sale_pay_system_action", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PAY_SYSTEM_ID", null: false
    t.integer "PERSON_TYPE_ID", null: false
    t.string "NAME", null: false
    t.string "ACTION_FILE"
    t.string "RESULT_FILE"
    t.string "NEW_WINDOW", limit: 1, default: "Y", null: false
    t.text "PARAMS"
    t.text "TARIF"
    t.string "HAVE_PAYMENT", limit: 1, default: "N", null: false
    t.string "HAVE_ACTION", limit: 1, default: "N", null: false
    t.string "HAVE_RESULT", limit: 1, default: "N", null: false
    t.string "HAVE_PREPAY", limit: 1, default: "N", null: false
    t.string "HAVE_RESULT_RECEIVE", limit: 1, default: "N", null: false
    t.string "ENCODING", limit: 45
    t.integer "LOGOTIP"
    t.index ["PAY_SYSTEM_ID", "PERSON_TYPE_ID"], name: "IX_SPSA_PSPT_UNI", unique: true
    t.index ["PERSON_TYPE_ID"], name: "IXS_PAY_SYSTEM_ACTION_PERSON_TYPE_ID"
  end

  create_table "b_sale_person_type", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2, null: false
    t.string "NAME", null: false
    t.integer "SORT", default: 150, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.index ["LID"], name: "IXS_PERSON_TYPE_LID"
  end

  create_table "b_sale_person_type_site", primary_key: ["PERSON_TYPE_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PERSON_TYPE_ID", default: 0, null: false
    t.string "SITE_ID", limit: 2, default: "", null: false
  end

  create_table "b_sale_product2product", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PRODUCT_ID", null: false
    t.integer "PARENT_PRODUCT_ID", null: false
    t.integer "CNT", null: false
    t.index ["PRODUCT_ID"], name: "IXS_PRODUCT2PRODUCT_PRODUCT_ID"
  end

  create_table "b_sale_recurring", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "MODULE", limit: 100
    t.integer "PRODUCT_ID"
    t.string "PRODUCT_NAME"
    t.string "PRODUCT_URL"
    t.integer "PRODUCT_PRICE_ID"
    t.string "PRICE_TYPE", limit: 1, default: "R", null: false
    t.string "RECUR_SCHEME_TYPE", limit: 1, default: "M", null: false
    t.integer "RECUR_SCHEME_LENGTH", default: 0, null: false
    t.string "WITHOUT_ORDER", limit: 1, default: "N", null: false
    t.decimal "PRICE", precision: 10, default: "0", null: false
    t.string "CURRENCY", limit: 3
    t.string "CANCELED", limit: 1, default: "N", null: false
    t.datetime "DATE_CANCELED"
    t.datetime "PRIOR_DATE"
    t.datetime "NEXT_DATE", null: false
    t.string "CALLBACK_FUNC", limit: 100
    t.string "PRODUCT_PROVIDER_CLASS", limit: 100
    t.string "DESCRIPTION"
    t.string "CANCELED_REASON"
    t.integer "ORDER_ID", null: false
    t.integer "REMAINING_ATTEMPTS", default: 0, null: false
    t.string "SUCCESS_PAYMENT", limit: 1, default: "Y", null: false
    t.index ["MODULE", "PRODUCT_ID", "PRODUCT_PRICE_ID"], name: "IX_S_R_PRODUCT_ID"
    t.index ["NEXT_DATE", "CANCELED", "REMAINING_ATTEMPTS"], name: "IX_S_R_NEXT_DATE"
    t.index ["USER_ID"], name: "IX_S_R_USER_ID"
  end

  create_table "b_sale_site2group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.index ["GROUP_ID", "SITE_ID"], name: "ix_sale_site2group", unique: true
  end

  create_table "b_sale_status", primary_key: "ID", id: :string, limit: 2, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TYPE", limit: 1, default: "O", null: false
    t.integer "SORT", default: 100, null: false
    t.string "NOTIFY", limit: 1, default: "Y", null: false
  end

  create_table "b_sale_status_group_task", primary_key: ["STATUS_ID", "GROUP_ID", "TASK_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "STATUS_ID", limit: 2, null: false
    t.integer "GROUP_ID", null: false
    t.integer "TASK_ID", null: false
  end

  create_table "b_sale_status_lang", primary_key: ["STATUS_ID", "LID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "STATUS_ID", limit: 2, null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 100, null: false
    t.string "DESCRIPTION", limit: 250
    t.index ["STATUS_ID", "LID"], name: "ixs_status_lang_status_id", unique: true
  end

  create_table "b_sale_store_barcode", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "BASKET_ID", null: false
    t.string "BARCODE", limit: 100
    t.integer "STORE_ID", null: false
    t.float "QUANTITY", limit: 53, null: false
    t.datetime "DATE_CREATE"
    t.datetime "DATE_MODIFY"
    t.integer "CREATED_BY"
    t.integer "MODIFIED_BY"
    t.integer "ORDER_DELIVERY_BASKET_ID", default: 0, null: false
    t.index ["ORDER_DELIVERY_BASKET_ID"], name: "IX_BSSB_O_DLV_BASKET_ID"
  end

  create_table "b_sale_tax", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LID", limit: 2, null: false
    t.string "NAME", limit: 250, null: false
    t.string "DESCRIPTION"
    t.datetime "TIMESTAMP_X", null: false
    t.string "CODE", limit: 50
    t.index ["LID"], name: "itax_lid"
  end

  create_table "b_sale_tax2location", primary_key: ["TAX_RATE_ID", "LOCATION_CODE", "LOCATION_TYPE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "TAX_RATE_ID", null: false
    t.string "LOCATION_CODE", limit: 100, null: false
    t.string "LOCATION_TYPE", limit: 1, default: "L", null: false
  end

  create_table "b_sale_tax_exempt2group", primary_key: ["GROUP_ID", "TAX_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.integer "TAX_ID", null: false
  end

  create_table "b_sale_tax_rate", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "TAX_ID", null: false
    t.integer "PERSON_TYPE_ID"
    t.decimal "VALUE", precision: 18, scale: 4, null: false
    t.string "CURRENCY", limit: 3
    t.string "IS_PERCENT", limit: 1, default: "Y", null: false
    t.string "IS_IN_PRICE", limit: 1, default: "N", null: false
    t.integer "APPLY_ORDER", default: 100, null: false
    t.datetime "TIMESTAMP_X", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.index ["IS_IN_PRICE"], name: "itax_inprice"
    t.index ["PERSON_TYPE_ID"], name: "itax_pers_type"
    t.index ["TAX_ID"], name: "itax_lid"
  end

  create_table "b_sale_tp", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 20, null: false
    t.string "ACTIVE", limit: 1, null: false
    t.string "NAME", limit: 50, null: false
    t.string "DESCRIPTION"
    t.text "SETTINGS"
    t.string "CATALOG_SECTION_TAB_CLASS_NAME"
    t.string "CLASS"
    t.index ["CODE"], name: "IX_CODE", unique: true
  end

  create_table "b_sale_tp_ebay_cat", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.integer "CATEGORY_ID", null: false
    t.integer "PARENT_ID", null: false
    t.integer "LEVEL", null: false
    t.string "CONDITION_ID_VALUES", null: false
    t.string "CONDITION_ID_DEFINITION_URL", null: false
    t.string "ITEM_SPECIFIC_ENABLED", limit: 1, null: false
    t.string "VARIATIONS_ENABLED", limit: 1, null: false
    t.string "PRODUCT_CREATION_ENABLED", limit: 1, null: false
    t.datetime "LAST_UPDATE", null: false
  end

  create_table "b_sale_tp_ebay_cat_var", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CATEGORY_ID", null: false
    t.string "NAME", null: false
    t.string "VALUE", null: false
    t.string "REQUIRED", limit: 1, null: false
    t.integer "MIN_VALUES", null: false
    t.integer "MAX_VALUES", null: false
    t.string "SELECTION_MODE", null: false
    t.string "ALLOWED_AS_VARIATION", limit: 1, null: false
    t.string "DEPENDENCY_NAME", null: false
    t.string "DEPENDENCY_VALUE", null: false
    t.string "HELP_URL", null: false
  end

  create_table "b_sale_tp_ebay_fq", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "FEED_TYPE", limit: 50, null: false
    t.text "DATA", null: false
  end

  create_table "b_sale_tp_ebay_fr", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "FILENAME", null: false
    t.string "FEED_TYPE", limit: 50, null: false
    t.datetime "UPLOAD_TIME", null: false
    t.string "PROCESSING_REQUEST_ID", limit: 50
    t.string "PROCESSING_RESULT", limit: 100
    t.text "RESULTS"
    t.string "IS_SUCCESS", limit: 1
  end

  create_table "b_sale_tp_map", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENTITY_ID", null: false
    t.string "VALUE_EXTERNAL", limit: 100, null: false
    t.string "VALUE_INTERNAL", limit: 100, null: false
    t.text "PARAMS"
    t.index ["ENTITY_ID", "VALUE_EXTERNAL", "VALUE_INTERNAL"], name: "IX_BSTPM_E_V_V", unique: true
  end

  create_table "b_sale_tp_map_entity", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "TRADING_PLATFORM_ID", null: false
    t.string "CODE", null: false
    t.index ["TRADING_PLATFORM_ID", "CODE"], name: "IX_CODE_TRADING_PLATFORM_ID", unique: true
  end

  create_table "b_sale_tp_order", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ORDER_ID", null: false
    t.integer "TRADING_PLATFORM_ID", null: false
    t.string "EXTERNAL_ORDER_ID", limit: 100, null: false
    t.text "PARAMS"
    t.index ["ORDER_ID", "TRADING_PLATFORM_ID", "EXTERNAL_ORDER_ID"], name: "IX_UNIQ_NUMBERS", unique: true
  end

  create_table "b_sale_user_account", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.decimal "CURRENT_BUDGET", precision: 18, scale: 4, default: "0.0", null: false
    t.string "CURRENCY", limit: 3, null: false
    t.string "LOCKED", limit: 1, default: "N", null: false
    t.datetime "DATE_LOCKED"
    t.text "NOTES"
    t.index ["USER_ID", "CURRENCY"], name: "IX_S_U_USER_ID", unique: true
  end

  create_table "b_sale_user_cards", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 100, null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "PAY_SYSTEM_ACTION_ID", null: false
    t.string "CURRENCY", limit: 3
    t.string "CARD_TYPE", limit: 20, null: false
    t.text "CARD_NUM", null: false
    t.string "CARD_CODE", limit: 5
    t.integer "CARD_EXP_MONTH", null: false
    t.integer "CARD_EXP_YEAR", null: false
    t.string "DESCRIPTION"
    t.decimal "SUM_MIN", precision: 18, scale: 4
    t.decimal "SUM_MAX", precision: 18, scale: 4
    t.string "SUM_CURRENCY", limit: 3
    t.string "LAST_STATUS", limit: 1
    t.string "LAST_STATUS_CODE", limit: 5
    t.string "LAST_STATUS_DESCRIPTION", limit: 250
    t.string "LAST_STATUS_MESSAGE"
    t.decimal "LAST_SUM", precision: 18, scale: 4
    t.string "LAST_CURRENCY", limit: 3
    t.datetime "LAST_DATE"
    t.index ["USER_ID", "ACTIVE", "CURRENCY"], name: "IX_S_U_C_USER_ID"
  end

  create_table "b_sale_user_props", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", null: false
    t.integer "USER_ID", null: false
    t.integer "PERSON_TYPE_ID", null: false
    t.datetime "DATE_UPDATE", null: false
    t.string "XML_ID", limit: 50
    t.string "VERSION_1C", limit: 15
    t.index ["PERSON_TYPE_ID"], name: "IXS_USER_PROPS_PERSON_TYPE_ID"
    t.index ["USER_ID"], name: "IXS_USER_PROPS_USER_ID"
    t.index ["XML_ID"], name: "IXS_USER_PROPS_XML_ID"
  end

  create_table "b_sale_user_props_value", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_PROPS_ID", null: false
    t.integer "ORDER_PROPS_ID", null: false
    t.string "NAME", null: false
    t.string "VALUE"
    t.index ["ORDER_PROPS_ID"], name: "IXS_USER_PROPS_VALUE_ORDER_PROPS_ID"
    t.index ["USER_PROPS_ID"], name: "IXS_USER_PROPS_VALUE_USER_PROPS_ID"
  end

  create_table "b_sale_user_transact", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "TRANSACT_DATE", null: false
    t.decimal "AMOUNT", precision: 18, scale: 4, default: "0.0", null: false
    t.string "CURRENCY", limit: 3, null: false
    t.string "DEBIT", limit: 1, default: "N", null: false
    t.integer "ORDER_ID"
    t.string "DESCRIPTION", null: false
    t.text "NOTES"
    t.integer "PAYMENT_ID"
    t.integer "EMPLOYEE_ID"
    t.index ["ORDER_ID"], name: "IX_S_U_T_ORDER_ID"
    t.index ["PAYMENT_ID"], name: "IX_S_U_T_PAYMENT_ID"
    t.index ["USER_ID", "CURRENCY"], name: "IX_S_U_T_USER_ID_CURRENCY"
    t.index ["USER_ID"], name: "IX_S_U_T_USER_ID"
  end

  create_table "b_sale_viewed_product", primary_key: "ID", id: :integer, unsigned: true, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "FUSER_ID", default: 0, null: false, unsigned: true
    t.datetime "DATE_VISIT", null: false
    t.integer "PRODUCT_ID", default: 0, null: false, unsigned: true
    t.string "MODULE", limit: 100
    t.string "LID", limit: 2, null: false
    t.string "NAME", null: false
    t.string "DETAIL_PAGE_URL"
    t.string "CURRENCY", limit: 3
    t.decimal "PRICE", precision: 18, scale: 2, default: "0.0", null: false
    t.string "NOTES"
    t.integer "PREVIEW_PICTURE"
    t.integer "DETAIL_PICTURE"
    t.string "CALLBACK_FUNC", limit: 45
    t.string "PRODUCT_PROVIDER_CLASS", limit: 100
    t.index ["DATE_VISIT"], name: "ixDATE_VISIT"
    t.index ["FUSER_ID", "LID"], name: "ixLID"
    t.index ["PRODUCT_ID"], name: "ixPRODUCT_ID"
  end

  create_table "b_search_content", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_CHANGE", null: false
    t.string "MODULE_ID", limit: 50, null: false
    t.string "ITEM_ID", null: false
    t.integer "CUSTOM_RANK", default: 0, null: false
    t.integer "USER_ID"
    t.string "ENTITY_TYPE_ID", limit: 50
    t.string "ENTITY_ID"
    t.text "URL"
    t.text "TITLE"
    t.text "BODY", size: :long
    t.text "TAGS"
    t.text "PARAM1"
    t.text "PARAM2"
    t.string "UPD", limit: 32
    t.datetime "DATE_FROM"
    t.datetime "DATE_TO"
    t.index ["ENTITY_ID", "ENTITY_TYPE_ID"], name: "IX_B_SEARCH_CONTENT_2", length: { ENTITY_ID: 50 }
    t.index ["MODULE_ID", "ITEM_ID"], name: "UX_B_SEARCH_CONTENT", unique: true
    t.index ["MODULE_ID", "PARAM1", "PARAM2"], name: "IX_B_SEARCH_CONTENT_1", length: { PARAM1: 50, PARAM2: 50 }
  end

  create_table "b_search_content_freq", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "STEM", default: 0, null: false
    t.string "LANGUAGE_ID", limit: 2, null: false
    t.string "SITE_ID", limit: 2
    t.float "FREQ"
    t.float "TF"
    t.index ["STEM", "LANGUAGE_ID", "SITE_ID"], name: "UX_B_SEARCH_CONTENT_FREQ", unique: true
  end

  create_table "b_search_content_param", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SEARCH_CONTENT_ID", null: false
    t.string "PARAM_NAME", limit: 100, null: false
    t.string "PARAM_VALUE", limit: 100, null: false
    t.index ["PARAM_NAME", "PARAM_VALUE", "SEARCH_CONTENT_ID"], name: "IX_B_SEARCH_CONTENT_PARAM_1", length: { PARAM_VALUE: 50 }
    t.index ["SEARCH_CONTENT_ID", "PARAM_NAME"], name: "IX_B_SEARCH_CONTENT_PARAM"
  end

  create_table "b_search_content_right", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SEARCH_CONTENT_ID", null: false
    t.string "GROUP_CODE", limit: 100, null: false
    t.index ["SEARCH_CONTENT_ID", "GROUP_CODE"], name: "UX_B_SEARCH_CONTENT_RIGHT", unique: true
  end

  create_table "b_search_content_site", primary_key: ["SEARCH_CONTENT_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SEARCH_CONTENT_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.text "URL"
  end

  create_table "b_search_content_stem", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1", force: :cascade do |t|
    t.integer "SEARCH_CONTENT_ID", null: false
    t.string "LANGUAGE_ID", limit: 2, null: false
    t.integer "STEM", null: false
    t.float "TF", null: false
    t.float "PS", null: false
    t.index ["SEARCH_CONTENT_ID"], name: "IND_B_SEARCH_CONTENT_STEM"
    t.index ["STEM", "LANGUAGE_ID", "TF", "PS", "SEARCH_CONTENT_ID"], name: "UX_B_SEARCH_CONTENT_STEM", unique: true
  end

  create_table "b_search_content_text", primary_key: "SEARCH_CONTENT_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SEARCH_CONTENT_MD5", limit: 32, null: false
    t.text "SEARCHABLE_CONTENT", size: :long
  end

  create_table "b_search_content_title", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1", force: :cascade do |t|
    t.integer "SEARCH_CONTENT_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.integer "POS", null: false
    t.string "WORD", limit: 100, null: false
    t.index ["SEARCH_CONTENT_ID"], name: "IND_B_SEARCH_CONTENT_TITLE"
    t.index ["SITE_ID", "WORD", "SEARCH_CONTENT_ID", "POS"], name: "UX_B_SEARCH_CONTENT_TITLE", unique: true
  end

  create_table "b_search_custom_rank", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "APPLIED", limit: 1, default: "N", null: false
    t.integer "RANK", default: 0, null: false
    t.string "SITE_ID", limit: 2, null: false
    t.string "MODULE_ID", limit: 200, null: false
    t.text "PARAM1"
    t.text "PARAM2"
    t.string "ITEM_ID"
    t.index ["SITE_ID", "MODULE_ID"], name: "IND_B_SEARCH_CUSTOM_RANK"
  end

  create_table "b_search_phrase", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TIMESTAMP_X", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.integer "RESULT_COUNT", null: false
    t.integer "PAGES", null: false
    t.string "SESSION_ID", limit: 32, null: false
    t.string "PHRASE", limit: 250
    t.string "TAGS", limit: 250
    t.text "URL_TO"
    t.string "URL_TO_404", limit: 1
    t.string "URL_TO_SITE_ID", limit: 2
    t.integer "STAT_SESS_ID"
    t.string "EVENT1", limit: 50
    t.index ["SESSION_ID", "PHRASE"], name: "IND_PK_B_SEARCH_PHRASE_SESS_PH", length: { PHRASE: 50 }
    t.index ["SESSION_ID", "TAGS"], name: "IND_PK_B_SEARCH_PHRASE_SESS_TG", length: { TAGS: 50 }
    t.index ["TIMESTAMP_X"], name: "IND_PK_B_SEARCH_PHRASE_TIME"
  end

  create_table "b_search_stem", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "STEM", limit: 50, null: false, collation: "utf8_bin"
    t.index ["STEM"], name: "UX_B_SEARCH_STEM", unique: true
  end

  create_table "b_search_suggest", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.string "FILTER_MD5", limit: 32, null: false
    t.string "PHRASE", limit: 250, null: false
    t.float "RATE", null: false
    t.datetime "TIMESTAMP_X", null: false
    t.integer "RESULT_COUNT", null: false
    t.index ["FILTER_MD5", "PHRASE", "RATE"], name: "IND_B_SEARCH_SUGGEST", length: { PHRASE: 50 }
    t.index ["PHRASE", "RATE"], name: "IND_B_SEARCH_SUGGEST_PHRASE", length: { PHRASE: 50 }
    t.index ["TIMESTAMP_X"], name: "IND_B_SEARCH_SUGGEST_TIME"
  end

  create_table "b_search_tags", primary_key: ["SEARCH_CONTENT_ID", "SITE_ID", "NAME"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci DELAY_KEY_WRITE=1", force: :cascade do |t|
    t.integer "SEARCH_CONTENT_ID", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.string "NAME", null: false, collation: "utf8_bin"
    t.index ["NAME"], name: "IX_B_SEARCH_TAGS_0"
  end

  create_table "b_search_user_right", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "GROUP_CODE", limit: 100, null: false
    t.index ["USER_ID", "GROUP_CODE"], name: "UX_B_SEARCH_USER_RIGHT", unique: true
  end

  create_table "b_sec_filter_mask", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SORT", default: 10, null: false
    t.string "SITE_ID", limit: 2
    t.string "FILTER_MASK", limit: 250
    t.string "LIKE_MASK", limit: 250
    t.string "PREG_MASK", limit: 250
  end

  create_table "b_sec_frame_mask", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SORT", default: 10, null: false
    t.string "SITE_ID", limit: 2
    t.string "FRAME_MASK", limit: 250
    t.string "LIKE_MASK", limit: 250
    t.string "PREG_MASK", limit: 250
  end

  create_table "b_sec_iprule", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "RULE_TYPE", limit: 1, default: "M", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "ADMIN_SECTION", limit: 1, default: "Y", null: false
    t.string "SITE_ID", limit: 2
    t.integer "SORT", default: 500, null: false
    t.datetime "ACTIVE_FROM"
    t.integer "ACTIVE_FROM_TIMESTAMP"
    t.datetime "ACTIVE_TO"
    t.integer "ACTIVE_TO_TIMESTAMP"
    t.string "NAME", limit: 250
    t.index ["ACTIVE_TO"], name: "ix_b_sec_iprule_active_to"
  end

  create_table "b_sec_iprule_excl_ip", primary_key: ["IPRULE_ID", "RULE_IP"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IPRULE_ID", null: false
    t.string "RULE_IP", limit: 50, null: false
    t.integer "SORT", default: 500, null: false
    t.bigint "IP_START"
    t.bigint "IP_END"
  end

  create_table "b_sec_iprule_excl_mask", primary_key: ["IPRULE_ID", "RULE_MASK"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IPRULE_ID", null: false
    t.string "RULE_MASK", limit: 250, null: false
    t.integer "SORT", default: 500, null: false
    t.string "LIKE_MASK", limit: 250
    t.string "PREG_MASK", limit: 250
  end

  create_table "b_sec_iprule_incl_ip", primary_key: ["IPRULE_ID", "RULE_IP"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IPRULE_ID", null: false
    t.string "RULE_IP", limit: 50, null: false
    t.integer "SORT", default: 500, null: false
    t.bigint "IP_START"
    t.bigint "IP_END"
  end

  create_table "b_sec_iprule_incl_mask", primary_key: ["IPRULE_ID", "RULE_MASK"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IPRULE_ID", null: false
    t.string "RULE_MASK", limit: 250, null: false
    t.integer "SORT", default: 500, null: false
    t.string "LIKE_MASK", limit: 250
    t.string "PREG_MASK", limit: 250
  end

  create_table "b_sec_recovery_codes", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "CODE", null: false
    t.string "USED", limit: 1, default: "N", null: false
    t.datetime "USING_DATE"
    t.string "USING_IP"
    t.index ["USER_ID"], name: "ix_b_sec_recovery_codes_user_id"
  end

  create_table "b_sec_redirect_url", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "IS_SYSTEM", limit: 1, default: "Y", null: false
    t.integer "SORT", default: 500, null: false
    t.string "URL", limit: 250, null: false
    t.string "PARAMETER_NAME", limit: 250, null: false
  end

  create_table "b_sec_session", primary_key: "SESSION_ID", id: :string, limit: 250, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.text "SESSION_DATA", size: :long
    t.index ["TIMESTAMP_X"], name: "ix_b_sec_session_time"
  end

  create_table "b_sec_user", primary_key: "USER_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, default: "N", null: false
    t.string "SECRET", limit: 64
    t.string "TYPE", limit: 16, null: false
    t.text "PARAMS"
    t.integer "ATTEMPTS"
    t.datetime "INITIAL_DATE"
    t.string "SKIP_MANDATORY", limit: 1, default: "N", null: false
    t.datetime "DEACTIVATE_UNTIL"
  end

  create_table "b_sec_virus", primary_key: "ID", id: :string, limit: 32, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TIMESTAMP_X", null: false
    t.string "SITE_ID", limit: 2
    t.string "SENT", limit: 1, default: "N", null: false
    t.text "INFO", size: :long, null: false
  end

  create_table "b_sec_white_list", primary_key: "ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "WHITE_SUBSTR", limit: 250, null: false
  end

  create_table "b_security_sitecheck", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "TEST_DATE"
    t.text "RESULTS", size: :long
  end

  create_table "b_sender_contact", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_UPDATE"
    t.string "NAME"
    t.string "EMAIL"
    t.string "PHONE", limit: 20
    t.integer "USER_ID"
    t.index ["EMAIL"], name: "UK_SENDER_CONTACT_EMAIL", unique: true
  end

  create_table "b_sender_contact_list", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CONTACT_ID", null: false
    t.integer "LIST_ID", null: false
    t.index ["CONTACT_ID", "LIST_ID"], name: "UK_SENDER_CONTACT_LIST", unique: true
  end

  create_table "b_sender_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100
    t.text "DESCRIPTION"
    t.integer "SORT", default: 100, null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.integer "ADDRESS_COUNT", default: 0, null: false
  end

  create_table "b_sender_group_connector", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.string "NAME", limit: 100
    t.text "ENDPOINT", size: :long
    t.integer "ADDRESS_COUNT", default: 0, null: false
    t.index ["GROUP_ID"], name: "IX_SENDER_GROUP_CONNECTOR"
  end

  create_table "b_sender_list", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100
    t.string "CODE", limit: 60
    t.integer "SORT", default: 100, null: false
  end

  create_table "b_sender_mailing", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_INSERT"
    t.string "NAME", limit: 100
    t.text "DESCRIPTION"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "SITE_ID", limit: 2, null: false
    t.integer "SORT", default: 100, null: false
    t.string "IS_PUBLIC", limit: 1, default: "Y", null: false
    t.string "TRACK_CLICK", limit: 1, default: "N", null: false
    t.text "TRIGGER_FIELDS"
    t.string "EMAIL_FROM"
    t.string "IS_TRIGGER", limit: 1, default: "N", null: false
  end

  create_table "b_sender_mailing_attachment", primary_key: ["CHAIN_ID", "FILE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CHAIN_ID", null: false
    t.integer "FILE_ID", null: false
  end

  create_table "b_sender_mailing_chain", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "MAILING_ID", null: false
    t.string "STATUS", limit: 1, null: false
    t.integer "POSTING_ID"
    t.integer "CREATED_BY"
    t.integer "PARENT_ID"
    t.string "IS_TRIGGER", limit: 1, default: "N", null: false
    t.datetime "DATE_INSERT"
    t.integer "TIME_SHIFT", default: 0, null: false
    t.datetime "LAST_EXECUTED"
    t.datetime "AUTO_SEND_TIME"
    t.string "EMAIL_FROM", null: false
    t.string "SUBJECT"
    t.text "MESSAGE", size: :long
    t.string "REITERATE", limit: 1, default: "N", null: false
    t.string "DAYS_OF_MONTH", limit: 100
    t.string "DAYS_OF_WEEK", limit: 15
    t.string "TIMES_OF_DAY"
    t.string "PRIORITY", limit: 60
    t.string "LINK_PARAMS"
    t.string "TEMPLATE_TYPE", limit: 30
    t.string "TEMPLATE_ID", limit: 60
    t.string "TITLE"
    t.index ["MAILING_ID", "STATUS"], name: "IX_SENDER_MAILING_CHAIN_MAILING"
    t.index ["REITERATE", "STATUS"], name: "IX_SENDER_MAILING_CHAIN_REITERATE"
  end

  create_table "b_sender_mailing_group", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "MAILING_ID", null: false
    t.integer "GROUP_ID", null: false
    t.integer "INCLUDE", default: 0, null: false
    t.index ["MAILING_ID", "GROUP_ID", "INCLUDE"], name: "UK_SENDER_MAILING_GROUP", unique: true
  end

  create_table "b_sender_mailing_subscription", primary_key: ["MAILING_ID", "CONTACT_ID", "IS_UNSUB"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "MAILING_ID", null: false
    t.integer "CONTACT_ID", null: false
    t.datetime "DATE_INSERT"
    t.string "IS_UNSUB", limit: 1, default: "N", null: false
  end

  create_table "b_sender_mailing_trigger", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "MAILING_CHAIN_ID", null: false
    t.integer "IS_TYPE_START", default: 1, null: false
    t.string "NAME"
    t.string "EVENT", null: false
    t.text "ENDPOINT", null: false
  end

  create_table "b_sender_posting", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_UPDATE"
    t.integer "MAILING_ID", null: false
    t.integer "MAILING_CHAIN_ID", null: false
    t.string "STATUS", limit: 1, default: "D", null: false
    t.datetime "DATE_SENT"
    t.datetime "DATE_CREATE"
    t.integer "COUNT_SEND_ALL", default: 0, null: false
    t.integer "COUNT_SEND_NONE", default: 0, null: false
    t.integer "COUNT_SEND_ERROR", default: 0, null: false
    t.integer "COUNT_SEND_SUCCESS", default: 0, null: false
    t.integer "COUNT_SEND_DENY", default: 0, null: false
    t.integer "COUNT_READ", default: 0, null: false
    t.integer "COUNT_CLICK", default: 0, null: false
    t.integer "COUNT_UNSUB", default: 0, null: false
    t.index ["MAILING_CHAIN_ID", "STATUS"], name: "IX_SENDER_POSTING_MAILING"
    t.index ["MAILING_ID", "STATUS"], name: "IX_SENDER_POSTING_MAILING_CHAIN"
  end

  create_table "b_sender_posting_click", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.integer "RECIPIENT_ID"
    t.datetime "DATE_INSERT"
    t.string "URL", limit: 2000
    t.index ["POSTING_ID", "RECIPIENT_ID"], name: "IX_SENDER_POSTING_CLICK"
  end

  create_table "b_sender_posting_read", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.integer "RECIPIENT_ID"
    t.datetime "DATE_INSERT"
    t.index ["POSTING_ID", "RECIPIENT_ID"], name: "IX_SENDER_POSTING_READ"
    t.index ["RECIPIENT_ID"], name: "ix_b_sender_posting_read_recip_id"
  end

  create_table "b_sender_posting_recipient", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "POSTING_ID", null: false
    t.string "STATUS", limit: 1, null: false
    t.datetime "DATE_SENT"
    t.string "NAME"
    t.string "EMAIL"
    t.string "PHONE", limit: 20
    t.integer "USER_ID"
    t.datetime "DATE_DENY"
    t.string "FIELDS", limit: 2000
    t.integer "ROOT_ID"
    t.string "IS_READ", limit: 1, default: "N", null: false
    t.string "IS_CLICK", limit: 1, default: "N", null: false
    t.string "IS_UNSUB", limit: 1, default: "N", null: false
    t.index ["EMAIL"], name: "IX_SENDER_POSTING_RECIP_EMAIL"
    t.index ["POSTING_ID", "STATUS"], name: "IX_SENDER_POSTING_RECIP_1"
  end

  create_table "b_sender_posting_unsub", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "RECIPIENT_ID", null: false
    t.integer "POSTING_ID", null: false
    t.datetime "DATE_INSERT"
    t.index ["POSTING_ID", "RECIPIENT_ID"], name: "IX_SENDER_POSTING_UNSUB"
  end

  create_table "b_sender_preset_template", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "NAME", limit: 50, null: false
    t.text "CONTENT"
  end

  create_table "b_seo_adv_autolog", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "CAMPAIGN_ID", null: false
    t.string "CAMPAIGN_XML_ID", null: false
    t.integer "BANNER_ID", null: false
    t.string "BANNER_XML_ID", null: false
    t.integer "CAUSE_CODE", default: 0
    t.string "SUCCESS", limit: 1, default: "Y"
    t.index ["ENGINE_ID"], name: "ix_b_seo_adv_autolog1"
    t.index ["TIMESTAMP_X"], name: "ix_b_seo_adv_autolog2"
  end

  create_table "b_seo_adv_banner", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.string "OWNER_ID", null: false
    t.string "OWNER_NAME", null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.string "XML_ID", null: false
    t.timestamp "LAST_UPDATE"
    t.string "NAME", null: false
    t.text "SETTINGS"
    t.integer "CAMPAIGN_ID", null: false
    t.integer "GROUP_ID"
    t.string "AUTO_QUANTITY_OFF", limit: 1, default: "N"
    t.string "AUTO_QUANTITY_ON", limit: 1, default: "N"
    t.index ["AUTO_QUANTITY_OFF", "AUTO_QUANTITY_ON"], name: "ix_b_seo_adv_banner2"
    t.index ["CAMPAIGN_ID"], name: "ix_b_seo_adv_banner1"
    t.index ["ENGINE_ID", "XML_ID"], name: "ux_b_seo_adv_banner", unique: true
  end

  create_table "b_seo_adv_campaign", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "OWNER_ID", null: false
    t.string "OWNER_NAME", null: false
    t.string "XML_ID", null: false
    t.string "NAME", null: false
    t.timestamp "LAST_UPDATE"
    t.text "SETTINGS"
    t.index ["ENGINE_ID", "XML_ID"], name: "ux_b_seo_adv_campaign", unique: true
  end

  create_table "b_seo_adv_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.string "OWNER_ID", null: false
    t.string "OWNER_NAME", null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.string "XML_ID", null: false
    t.timestamp "LAST_UPDATE"
    t.string "NAME", null: false
    t.text "SETTINGS"
    t.integer "CAMPAIGN_ID", null: false
    t.index ["CAMPAIGN_ID"], name: "ix_b_seo_adv_group1"
    t.index ["ENGINE_ID", "XML_ID"], name: "ux_b_seo_adv_group", unique: true
  end

  create_table "b_seo_adv_link", primary_key: ["LINK_TYPE", "LINK_ID", "BANNER_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LINK_TYPE", limit: 1, null: false
    t.integer "LINK_ID", null: false
    t.integer "BANNER_ID", null: false
  end

  create_table "b_seo_adv_log", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "REQUEST_URI", limit: 100, null: false
    t.text "REQUEST_DATA"
    t.float "RESPONSE_TIME", null: false
    t.integer "RESPONSE_STATUS"
    t.text "RESPONSE_DATA"
    t.index ["ENGINE_ID"], name: "ix_b_seo_adv_log1"
    t.index ["TIMESTAMP_X"], name: "ix_b_seo_adv_log2"
  end

  create_table "b_seo_adv_order", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.integer "CAMPAIGN_ID", null: false
    t.integer "BANNER_ID", null: false
    t.integer "ORDER_ID", null: false
    t.float "SUM", default: 0.0
    t.string "PROCESSED", limit: 1, default: "N"
    t.index ["ENGINE_ID", "CAMPAIGN_ID", "BANNER_ID", "ORDER_ID"], name: "ux_b_seo_adv_order", unique: true
    t.index ["ORDER_ID", "PROCESSED"], name: "ix_b_seo_adv_order1"
  end

  create_table "b_seo_adv_region", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "ENGINE_ID", null: false
    t.string "OWNER_ID", null: false
    t.string "OWNER_NAME", null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.string "XML_ID", null: false
    t.timestamp "LAST_UPDATE"
    t.string "NAME", null: false
    t.text "SETTINGS"
    t.integer "PARENT_ID", null: false
    t.index ["ENGINE_ID", "XML_ID"], name: "ux_b_seo_adv_region", unique: true
    t.index ["PARENT_ID"], name: "ix_b_seo_adv_region1"
  end

  create_table "b_seo_keywords", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.string "URL"
    t.text "KEYWORDS"
    t.index ["URL", "SITE_ID"], name: "ix_b_seo_keywords_url"
  end

  create_table "b_seo_search_engine", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "CODE", limit: 50, null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.integer "SORT", default: 100
    t.string "NAME", null: false
    t.string "CLIENT_ID"
    t.string "CLIENT_SECRET"
    t.string "REDIRECT_URI"
    t.text "SETTINGS"
    t.index ["CODE"], name: "ux_b_seo_search_engine_code", unique: true
  end

  create_table "b_seo_service_log", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_INSERT", null: false
    t.string "TYPE", limit: 20, null: false
    t.string "CODE", limit: 20
    t.string "MESSAGE", limit: 1000, null: false
    t.string "GROUP_ID", limit: 20, null: false
  end

  create_table "b_seo_service_rtg_queue", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_INSERT"
    t.string "TYPE", limit: 20, null: false
    t.string "ACCOUNT_ID", limit: 15
    t.string "AUDIENCE_ID", limit: 15, null: false
    t.string "CONTACT_TYPE", limit: 15, null: false
    t.string "VALUE", null: false
    t.string "ACTION", limit: 3, null: false
    t.datetime "DATE_AUTO_REMOVE"
    t.index ["ACTION", "DATE_AUTO_REMOVE"], name: "IX_B_SEO_SRV_RTG_QUEUE_1"
    t.index ["TYPE", "ACTION"], name: "IX_B_SEO_SRV_RTG_QUEUE_2"
  end

  create_table "b_seo_sitemap", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "SITE_ID", limit: 2, null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.string "NAME", default: ""
    t.datetime "DATE_RUN"
    t.text "SETTINGS", size: :long
  end

  create_table "b_seo_sitemap_entity", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ENTITY_TYPE", null: false
    t.integer "ENTITY_ID", null: false
    t.integer "SITEMAP_ID", null: false
    t.index ["ENTITY_TYPE", "ENTITY_ID"], name: "ix_b_seo_sitemap_entity_1"
    t.index ["SITEMAP_ID"], name: "ix_b_seo_sitemap_entity_2"
  end

  create_table "b_seo_sitemap_iblock", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "IBLOCK_ID", null: false
    t.integer "SITEMAP_ID", null: false
    t.index ["IBLOCK_ID"], name: "ix_b_seo_sitemap_iblock_1"
    t.index ["SITEMAP_ID"], name: "ix_b_seo_sitemap_iblock_2"
  end

  create_table "b_seo_sitemap_runtime", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PID", null: false
    t.string "PROCESSED", limit: 1, default: "N", null: false
    t.string "ITEM_PATH", limit: 700
    t.integer "ITEM_ID"
    t.string "ITEM_TYPE", limit: 1, default: "D", null: false
    t.string "ACTIVE", limit: 1, default: "Y"
    t.string "ACTIVE_ELEMENT", limit: 1, default: "Y"
    t.index ["PID", "PROCESSED", "ITEM_TYPE", "ITEM_ID"], name: "ix_seo_sitemap_runtime1"
  end

  create_table "b_seo_yandex_direct_stat", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CAMPAIGN_ID", null: false
    t.integer "BANNER_ID", null: false
    t.date "DATE_DAY", null: false
    t.string "CURRENCY", limit: 3
    t.float "SUM", default: 0.0
    t.float "SUM_SEARCH", default: 0.0
    t.float "SUM_CONTEXT", default: 0.0
    t.integer "CLICKS", default: 0
    t.integer "CLICKS_SEARCH", default: 0
    t.integer "CLICKS_CONTEXT", default: 0
    t.integer "SHOWS", default: 0
    t.integer "SHOWS_SEARCH", default: 0
    t.integer "SHOWS_CONTEXT", default: 0
    t.index ["BANNER_ID", "DATE_DAY"], name: "ux_seo_yandex_direct_stat", unique: true
    t.index ["CAMPAIGN_ID"], name: "ix_seo_yandex_direct_stat1"
  end

  create_table "b_short_uri", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "URI", limit: 250, null: false
    t.integer "URI_CRC", null: false
    t.binary "SHORT_URI", limit: 250, null: false
    t.integer "SHORT_URI_CRC", null: false
    t.integer "STATUS", default: 301, null: false
    t.datetime "MODIFIED", null: false
    t.datetime "LAST_USED"
    t.integer "NUMBER_USED", default: 0, null: false
    t.index ["SHORT_URI_CRC"], name: "ux_b_short_uri_1"
    t.index ["URI_CRC"], name: "ux_b_short_uri_2"
  end

  create_table "b_site_template", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2, null: false
    t.string "CONDITION"
    t.integer "SORT", default: 500, null: false
    t.string "TEMPLATE", null: false
    t.index ["SITE_ID"], name: "ix_site_template_site"
  end

  create_table "b_smile", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TYPE", limit: 1, default: "S", null: false
    t.integer "SET_ID", default: 0, null: false
    t.integer "SORT", default: 150, null: false
    t.string "TYPING", limit: 100
    t.string "CLICKABLE", limit: 1, default: "Y", null: false
    t.string "HIDDEN", limit: 1, default: "N", null: false
    t.string "IMAGE", null: false
    t.string "IMAGE_DEFINITION", limit: 10, default: "SD", null: false
    t.integer "IMAGE_WIDTH", default: 0, null: false
    t.integer "IMAGE_HEIGHT", default: 0, null: false
  end

  create_table "b_smile_lang", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TYPE", limit: 1, default: "S", null: false
    t.integer "SID", null: false
    t.string "LID", limit: 2, null: false
    t.string "NAME", null: false
    t.index ["TYPE", "SID", "LID"], name: "UX_SMILE_SL", unique: true
  end

  create_table "b_smile_set", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "TYPE", limit: 1, default: "G", null: false
    t.integer "PARENT_ID", default: 0, null: false
    t.string "STRING_ID"
    t.integer "SORT", default: 150, null: false
  end

  create_table "b_socialservices_ap", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "USER_ID", null: false
    t.string "DOMAIN", null: false
    t.string "ENDPOINT"
    t.string "LOGIN", limit: 50
    t.string "PASSWORD", limit: 50
    t.datetime "LAST_AUTHORIZE"
    t.string "SETTINGS", limit: 1000
    t.index ["USER_ID", "DOMAIN"], name: "ix_socialservices_ap1"
  end

  create_table "b_socialservices_contact", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "USER_ID", null: false
    t.integer "CONTACT_USER_ID"
    t.integer "CONTACT_XML_ID"
    t.string "CONTACT_NAME"
    t.string "CONTACT_LAST_NAME"
    t.string "CONTACT_PHOTO"
    t.string "NOTIFY", limit: 1, default: "N"
    t.datetime "LAST_AUTHORIZE"
    t.index ["CONTACT_USER_ID"], name: "ix_b_socialservices_contact2"
    t.index ["LAST_AUTHORIZE"], name: "ix_b_socialservices_contact4"
    t.index ["TIMESTAMP_X"], name: "ix_b_socialservices_contact3"
    t.index ["USER_ID"], name: "ix_b_socialservices_contact1"
  end

  create_table "b_socialservices_contact_connect", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }
    t.integer "CONTACT_ID"
    t.integer "LINK_ID"
    t.integer "CONTACT_PROFILE_ID", null: false
    t.string "CONTACT_PORTAL", null: false
    t.string "CONNECT_TYPE", limit: 1, default: "P"
    t.datetime "LAST_AUTHORIZE"
    t.index ["CONTACT_ID"], name: "ix_b_socialservices_contact_connect1"
    t.index ["LAST_AUTHORIZE"], name: "ix_b_socialservices_contact_connect3"
    t.index ["LINK_ID"], name: "ix_b_socialservices_contact_connect2"
  end

  create_table "b_socialservices_message", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "SOCSERV_USER_ID", null: false
    t.string "PROVIDER", limit: 100, null: false
    t.string "MESSAGE", limit: 1000
    t.datetime "INSERT_DATE"
    t.string "SUCCES_SENT", limit: 1, default: "N", null: false
  end

  create_table "b_socialservices_user", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "LOGIN", limit: 100, null: false
    t.string "NAME", limit: 100
    t.string "LAST_NAME", limit: 100
    t.string "EMAIL", limit: 100
    t.integer "PERSONAL_PHOTO"
    t.string "EXTERNAL_AUTH_ID", limit: 100, null: false
    t.integer "USER_ID", null: false
    t.string "XML_ID", limit: 100, null: false
    t.string "CAN_DELETE", limit: 1, default: "Y", null: false
    t.string "PERSONAL_WWW", limit: 100
    t.string "PERMISSIONS", limit: 555
    t.string "OATOKEN", limit: 3000
    t.integer "OATOKEN_EXPIRES"
    t.string "OASECRET", limit: 250
    t.string "REFRESH_TOKEN", limit: 1000
    t.string "SEND_ACTIVITY", limit: 1, default: "Y"
    t.string "SITE_ID", limit: 50
    t.string "INITIALIZED", limit: 1, default: "N"
    t.index ["INITIALIZED"], name: "IX_B_SOCIALSERVICES_US_2"
    t.index ["LOGIN"], name: "IX_B_SOCIALSERVICES_US_3"
    t.index ["USER_ID"], name: "IX_B_SOCIALSERVICES_US_1"
    t.index ["XML_ID", "EXTERNAL_AUTH_ID"], name: "IX_B_SOCIALSERVICES_USER", unique: true
  end

  create_table "b_socialservices_user_link", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "SOCSERV_USER_ID", null: false
    t.integer "LINK_USER_ID"
    t.string "LINK_UID", limit: 100, null: false
    t.string "LINK_NAME"
    t.string "LINK_LAST_NAME"
    t.string "LINK_PICTURE"
    t.string "LINK_EMAIL"
    t.timestamp "TIMESTAMP_X"
    t.index ["LINK_UID"], name: "ix_b_socialservices_user_link_7"
    t.index ["LINK_USER_ID", "TIMESTAMP_X"], name: "ix_b_socialservices_user_link_6"
    t.index ["SOCSERV_USER_ID"], name: "ix_b_socialservices_user_link_5"
  end

  create_table "b_sticker", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SITE_ID", limit: 2
    t.string "PAGE_URL", null: false
    t.string "PAGE_TITLE", null: false
    t.datetime "DATE_CREATE", null: false
    t.datetime "DATE_UPDATE", null: false
    t.integer "MODIFIED_BY", null: false
    t.integer "CREATED_BY", null: false
    t.string "PERSONAL", limit: 1, default: "N", null: false
    t.text "CONTENT"
    t.integer "POS_TOP"
    t.integer "POS_LEFT"
    t.integer "WIDTH"
    t.integer "HEIGHT"
    t.integer "COLOR"
    t.string "COLLAPSED", limit: 1, default: "N", null: false
    t.string "COMPLETED", limit: 1, default: "N", null: false
    t.string "CLOSED", limit: 1, default: "N", null: false
    t.string "DELETED", limit: 1, default: "N", null: false
    t.integer "MARKER_TOP"
    t.integer "MARKER_LEFT"
    t.integer "MARKER_WIDTH"
    t.integer "MARKER_HEIGHT"
    t.text "MARKER_ADJUST"
  end

  create_table "b_sticker_group_task", primary_key: ["GROUP_ID", "TASK_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "GROUP_ID", null: false
    t.integer "TASK_ID", null: false
  end

  create_table "b_subscription", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_UPDATE"
    t.integer "USER_ID"
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "EMAIL", null: false
    t.string "FORMAT", limit: 4, default: "text", null: false
    t.string "CONFIRM_CODE", limit: 8
    t.string "CONFIRMED", limit: 1, default: "N", null: false
    t.datetime "DATE_CONFIRM", null: false
    t.index ["CONFIRMED", "DATE_CONFIRM"], name: "IX_DATE_CONFIRM"
    t.index ["EMAIL", "USER_ID"], name: "UK_SUBSCRIPTION_EMAIL", unique: true
  end

  create_table "b_subscription_rubric", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "SUBSCRIPTION_ID", null: false
    t.integer "LIST_RUBRIC_ID", null: false
    t.index ["SUBSCRIPTION_ID", "LIST_RUBRIC_ID"], name: "UK_SUBSCRIPTION_RUBRIC", unique: true
  end

  create_table "b_task", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "NAME", limit: 100, null: false
    t.string "LETTER", limit: 1
    t.string "MODULE_ID", limit: 50, null: false
    t.string "SYS", limit: 1, null: false
    t.string "DESCRIPTION"
    t.string "BINDING", limit: 50, default: "module"
    t.index ["MODULE_ID", "BINDING", "LETTER", "SYS"], name: "ix_task"
  end

  create_table "b_task_operation", primary_key: ["TASK_ID", "OPERATION_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "TASK_ID", null: false
    t.integer "OPERATION_ID", null: false
  end

  create_table "b_undo", primary_key: "ID", id: :string, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "MODULE_ID", limit: 50
    t.string "UNDO_TYPE", limit: 50
    t.string "UNDO_HANDLER"
    t.text "CONTENT", size: :medium
    t.integer "USER_ID"
    t.integer "TIMESTAMP_X"
  end

  create_table "b_urlpreview_metadata", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "URL", limit: 200, null: false
    t.string "TYPE", limit: 1, default: "S", null: false
    t.datetime "DATE_INSERT", null: false
    t.datetime "DATE_EXPIRE"
    t.string "TITLE", limit: 200
    t.text "DESCRIPTION"
    t.integer "IMAGE_ID"
    t.string "IMAGE"
    t.text "EMBED", size: :medium
    t.text "EXTRA"
    t.index ["URL"], name: "IX_URLPREVIEW_METADATA_URL"
  end

  create_table "b_urlpreview_route", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ROUTE", limit: 200, null: false
    t.string "MODULE", limit: 50, null: false
    t.string "CLASS", limit: 150, null: false
    t.text "PARAMETERS", size: :medium
    t.index ["ROUTE"], name: "UX_URLPREVIEW_ROUTE_ROUTE", unique: true
  end

  create_table "b_user", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "LOGIN", limit: 50, null: false
    t.string "PASSWORD", limit: 50, null: false
    t.string "CHECKWORD", limit: 50
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "NAME", limit: 50
    t.string "LAST_NAME", limit: 50
    t.string "EMAIL"
    t.datetime "LAST_LOGIN"
    t.datetime "DATE_REGISTER", null: false
    t.string "LID", limit: 2
    t.string "PERSONAL_PROFESSION"
    t.string "PERSONAL_WWW"
    t.string "PERSONAL_ICQ"
    t.string "PERSONAL_GENDER", limit: 1
    t.string "PERSONAL_BIRTHDATE", limit: 50
    t.integer "PERSONAL_PHOTO"
    t.string "PERSONAL_PHONE"
    t.string "PERSONAL_FAX"
    t.string "PERSONAL_MOBILE"
    t.string "PERSONAL_PAGER"
    t.text "PERSONAL_STREET"
    t.string "PERSONAL_MAILBOX"
    t.string "PERSONAL_CITY"
    t.string "PERSONAL_STATE"
    t.string "PERSONAL_ZIP"
    t.string "PERSONAL_COUNTRY"
    t.text "PERSONAL_NOTES"
    t.string "WORK_COMPANY"
    t.string "WORK_DEPARTMENT"
    t.string "WORK_POSITION"
    t.string "WORK_WWW"
    t.string "WORK_PHONE"
    t.string "WORK_FAX"
    t.string "WORK_PAGER"
    t.text "WORK_STREET"
    t.string "WORK_MAILBOX"
    t.string "WORK_CITY"
    t.string "WORK_STATE"
    t.string "WORK_ZIP"
    t.string "WORK_COUNTRY"
    t.text "WORK_PROFILE"
    t.integer "WORK_LOGO"
    t.text "WORK_NOTES"
    t.text "ADMIN_NOTES"
    t.string "STORED_HASH", limit: 32
    t.string "XML_ID"
    t.date "PERSONAL_BIRTHDAY"
    t.string "EXTERNAL_AUTH_ID"
    t.datetime "CHECKWORD_TIME"
    t.string "SECOND_NAME", limit: 50
    t.string "CONFIRM_CODE", limit: 8
    t.integer "LOGIN_ATTEMPTS"
    t.datetime "LAST_ACTIVITY_DATE"
    t.string "AUTO_TIME_ZONE", limit: 1
    t.string "TIME_ZONE", limit: 50
    t.integer "TIME_ZONE_OFFSET"
    t.string "TITLE"
    t.string "BX_USER_ID", limit: 32
    t.string "LANGUAGE_ID", limit: 2
    t.index ["EMAIL"], name: "ix_b_user_email"
    t.index ["LAST_ACTIVITY_DATE"], name: "ix_b_user_activity_date"
    t.index ["LOGIN", "EXTERNAL_AUTH_ID"], name: "ix_login", unique: true
    t.index ["XML_ID"], name: "IX_B_USER_XML_ID"
  end

  create_table "b_user_access", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID"
    t.string "PROVIDER_ID", limit: 50
    t.string "ACCESS_CODE", limit: 100
    t.index ["ACCESS_CODE"], name: "ix_ua_access"
    t.index ["USER_ID", "ACCESS_CODE"], name: "ix_ua_user_access"
    t.index ["USER_ID", "PROVIDER_ID"], name: "ix_ua_user_provider"
  end

  create_table "b_user_access_check", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID"
    t.string "PROVIDER_ID", limit: 50
    t.index ["USER_ID", "PROVIDER_ID"], name: "ix_uac_user_provider"
  end

  create_table "b_user_counter", primary_key: ["USER_ID", "SITE_ID", "CODE"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "SITE_ID", limit: 2, default: "**", null: false
    t.string "CODE", limit: 50, null: false
    t.integer "CNT", default: 0, null: false
    t.datetime "LAST_DATE"
    t.string "TAG"
    t.text "PARAMS"
    t.string "SENT", limit: 1, default: "0"
    t.datetime "TIMESTAMP_X", default: "3000-01-01 00:00:00", null: false
    t.index ["CODE"], name: "ix_buc_code"
    t.index ["SENT", "USER_ID"], name: "ix_buc_sent_userid"
    t.index ["TAG"], name: "ix_buc_tag"
    t.index ["TIMESTAMP_X"], name: "ix_buc_ts"
  end

  create_table "b_user_digest", primary_key: "USER_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "DIGEST_HA1", limit: 32, null: false
  end

  create_table "b_user_field", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ENTITY_ID", limit: 20
    t.string "FIELD_NAME", limit: 20
    t.string "USER_TYPE_ID", limit: 50
    t.string "XML_ID"
    t.integer "SORT"
    t.string "MULTIPLE", limit: 1, default: "N", null: false
    t.string "MANDATORY", limit: 1, default: "N", null: false
    t.string "SHOW_FILTER", limit: 1, default: "N", null: false
    t.string "SHOW_IN_LIST", limit: 1, default: "Y", null: false
    t.string "EDIT_IN_LIST", limit: 1, default: "Y", null: false
    t.string "IS_SEARCHABLE", limit: 1, default: "N", null: false
    t.text "SETTINGS"
    t.index ["ENTITY_ID", "FIELD_NAME"], name: "ux_user_type_entity", unique: true
  end

  create_table "b_user_field_confirm", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.timestamp "DATE_CHANGE", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.string "FIELD", null: false
    t.string "FIELD_VALUE", null: false
    t.string "CONFIRM_CODE", limit: 32, null: false
    t.index ["USER_ID", "CONFIRM_CODE"], name: "ix_b_user_field_confirm1"
  end

  create_table "b_user_field_enum", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_FIELD_ID"
    t.string "VALUE", null: false
    t.string "DEF", limit: 1, default: "N", null: false
    t.integer "SORT", default: 500, null: false
    t.string "XML_ID", null: false
    t.index ["USER_FIELD_ID", "XML_ID"], name: "ux_user_field_enum", unique: true
  end

  create_table "b_user_field_lang", primary_key: ["USER_FIELD_ID", "LANGUAGE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_FIELD_ID", null: false
    t.string "LANGUAGE_ID", limit: 2, null: false
    t.string "EDIT_FORM_LABEL"
    t.string "LIST_COLUMN_LABEL"
    t.string "LIST_FILTER_LABEL"
    t.string "ERROR_MESSAGE"
    t.string "HELP_MESSAGE"
  end

  create_table "b_user_group", id: false, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.integer "GROUP_ID", null: false
    t.datetime "DATE_ACTIVE_FROM"
    t.datetime "DATE_ACTIVE_TO"
    t.index ["GROUP_ID"], name: "ix_user_group_group"
    t.index ["USER_ID", "GROUP_ID"], name: "ix_user_group", unique: true
  end

  create_table "b_user_hit_auth", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "HASH", limit: 32, null: false
    t.string "URL", null: false
    t.string "SITE_ID", limit: 2
    t.timestamp "TIMESTAMP_X", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["HASH"], name: "IX_USER_HIT_AUTH_1"
    t.index ["TIMESTAMP_X"], name: "IX_USER_HIT_AUTH_3"
    t.index ["USER_ID"], name: "IX_USER_HIT_AUTH_2"
  end

  create_table "b_user_option", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.string "CATEGORY", limit: 50, null: false
    t.string "NAME", null: false
    t.text "VALUE", size: :medium
    t.string "COMMON", limit: 1, default: "N", null: false
    t.index ["USER_ID", "CATEGORY", "NAME"], name: "ux_user_category_name", unique: true
  end

  create_table "b_user_stored_auth", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "USER_ID", null: false
    t.datetime "DATE_REG", null: false
    t.datetime "LAST_AUTH", null: false
    t.string "STORED_HASH", limit: 32, null: false
    t.string "TEMP_HASH", limit: 1, default: "N", null: false
    t.integer "IP_ADDR", null: false, unsigned: true
    t.index ["USER_ID"], name: "ux_user_hash"
  end

  create_table "b_utm_blog_comment", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "VALUE_ID", null: false
    t.integer "FIELD_ID", null: false
    t.text "VALUE"
    t.integer "VALUE_INT"
    t.float "VALUE_DOUBLE"
    t.datetime "VALUE_DATE"
    t.index ["FIELD_ID"], name: "ix_utm_BLOG_COMMENT_1"
    t.index ["VALUE_ID"], name: "ix_utm_BLOG_COMMENT_2"
  end

  create_table "b_utm_blog_post", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "VALUE_ID", null: false
    t.integer "FIELD_ID", null: false
    t.text "VALUE"
    t.integer "VALUE_INT"
    t.float "VALUE_DOUBLE"
    t.datetime "VALUE_DATE"
    t.index ["FIELD_ID"], name: "ix_utm_BLOG_POST_1"
    t.index ["VALUE_ID"], name: "ix_utm_BLOG_POST_2"
  end

  create_table "b_utm_forum_message", primary_key: "ID", id: :integer, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "VALUE_ID", null: false
    t.integer "FIELD_ID", null: false
    t.text "VALUE"
    t.integer "VALUE_INT"
    t.float "VALUE_DOUBLE"
    t.datetime "VALUE_DATE"
    t.index ["FIELD_ID"], name: "ix_utm_FORUM_MESSAGE_1"
    t.index ["VALUE_ID"], name: "ix_utm_FORUM_MESSAGE_2"
  end

  create_table "b_utm_iblock_20_section", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "VALUE_ID", null: false
    t.integer "FIELD_ID", null: false
    t.text "VALUE"
    t.integer "VALUE_INT"
    t.float "VALUE_DOUBLE"
    t.datetime "VALUE_DATE"
    t.index ["FIELD_ID"], name: "ix_utm_IBLOCK_20_SECTION_1"
    t.index ["VALUE_ID"], name: "ix_utm_IBLOCK_20_SECTION_2"
  end

  create_table "b_uts_blog_comment", primary_key: "VALUE_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "UF_BLOG_COMMENT_DOC"
  end

  create_table "b_uts_blog_post", primary_key: "VALUE_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.text "UF_BLOG_POST_DOC"
    t.integer "UF_GRATITUDE"
  end

  create_table "b_uts_forum_message", primary_key: "VALUE_ID", id: :integer, default: nil, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "UF_FORUM_MES_URL_PRV"
  end

  create_table "b_uts_iblock_20_section", primary_key: "VALUE_ID", id: :integer, default: nil, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "UF_MENU_TOP"
    t.integer "UF_MAIN"
  end

  create_table "b_vote", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CHANNEL_ID", default: 0, null: false
    t.integer "C_SORT", default: 100
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "NOTIFY", limit: 1, default: "N", null: false
    t.integer "AUTHOR_ID"
    t.datetime "TIMESTAMP_X", null: false
    t.datetime "DATE_START", null: false
    t.datetime "DATE_END", null: false
    t.string "URL"
    t.integer "COUNTER", default: 0, null: false
    t.string "TITLE"
    t.text "DESCRIPTION"
    t.string "DESCRIPTION_TYPE", limit: 4, default: "html", null: false
    t.integer "IMAGE_ID"
    t.string "EVENT1"
    t.string "EVENT2"
    t.string "EVENT3"
    t.integer "UNIQUE_TYPE", default: 2, null: false
    t.integer "KEEP_IP_SEC"
    t.integer "DELAY"
    t.string "DELAY_TYPE", limit: 1
    t.string "TEMPLATE"
    t.string "RESULT_TEMPLATE"
    t.index ["CHANNEL_ID"], name: "IX_CHANNEL_ID"
  end

  create_table "b_vote_answer", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "TIMESTAMP_X", null: false
    t.integer "QUESTION_ID", default: 0, null: false
    t.integer "C_SORT", default: 100
    t.text "MESSAGE"
    t.string "MESSAGE_TYPE", limit: 4, default: "html", null: false
    t.integer "COUNTER", default: 0, null: false
    t.integer "FIELD_TYPE", default: 0, null: false
    t.integer "FIELD_WIDTH"
    t.integer "FIELD_HEIGHT"
    t.string "FIELD_PARAM"
    t.string "COLOR", limit: 7
    t.index ["QUESTION_ID"], name: "IX_QUESTION_ID"
  end

  create_table "b_vote_channel", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "SYMBOLIC_NAME", null: false
    t.integer "C_SORT", default: 100
    t.string "FIRST_SITE_ID", limit: 2
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.string "HIDDEN", limit: 1, default: "N", null: false
    t.datetime "TIMESTAMP_X", null: false
    t.string "TITLE", null: false
    t.string "VOTE_SINGLE", limit: 1, default: "Y", null: false
    t.string "USE_CAPTCHA", limit: 1, default: "N", null: false
  end

  create_table "b_vote_channel_2_group", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CHANNEL_ID", default: 0, null: false
    t.integer "GROUP_ID", default: 0, null: false
    t.integer "PERMISSION", default: 0, null: false
    t.index ["CHANNEL_ID", "GROUP_ID"], name: "IX_VOTE_CHANNEL_ID_GROUP_ID"
  end

  create_table "b_vote_channel_2_site", primary_key: ["CHANNEL_ID", "SITE_ID"], options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "CHANNEL_ID", default: 0, null: false
    t.string "SITE_ID", limit: 2, null: false
  end

  create_table "b_vote_event", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "VOTE_ID", default: 0, null: false
    t.integer "VOTE_USER_ID", default: 0, null: false
    t.datetime "DATE_VOTE", null: false
    t.integer "STAT_SESSION_ID"
    t.string "IP", limit: 15
    t.string "VALID", limit: 1, default: "Y", null: false
    t.index ["VOTE_ID", "IP"], name: "IX_B_VOTE_EVENT_2"
    t.index ["VOTE_USER_ID"], name: "IX_USER_ID"
  end

  create_table "b_vote_event_answer", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "EVENT_QUESTION_ID", default: 0, null: false
    t.integer "ANSWER_ID", default: 0, null: false
    t.text "MESSAGE"
    t.index ["EVENT_QUESTION_ID"], name: "IX_EVENT_QUESTION_ID"
  end

  create_table "b_vote_event_question", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "EVENT_ID", default: 0, null: false
    t.integer "QUESTION_ID", default: 0, null: false
    t.index ["EVENT_ID"], name: "IX_EVENT_ID"
  end

  create_table "b_vote_question", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.string "ACTIVE", limit: 1, default: "Y", null: false
    t.datetime "TIMESTAMP_X", null: false
    t.integer "VOTE_ID", default: 0, null: false
    t.integer "C_SORT", default: 100
    t.integer "COUNTER", default: 0, null: false
    t.text "QUESTION", null: false
    t.string "QUESTION_TYPE", limit: 4, default: "html", null: false
    t.integer "IMAGE_ID"
    t.string "DIAGRAM", limit: 1, default: "Y", null: false
    t.string "REQUIRED", limit: 1, default: "N", null: false
    t.string "DIAGRAM_TYPE", limit: 10, default: "histogram", null: false
    t.string "TEMPLATE"
    t.string "TEMPLATE_NEW"
    t.index ["VOTE_ID"], name: "IX_VOTE_ID"
  end

  create_table "b_vote_user", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "STAT_GUEST_ID"
    t.integer "AUTH_USER_ID"
    t.integer "COUNTER", default: 0, null: false
    t.datetime "DATE_FIRST", null: false
    t.datetime "DATE_LAST", null: false
    t.string "LAST_IP", limit: 15
  end

  create_table "b_xml_tree", primary_key: "ID", id: :integer, options: "ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci", force: :cascade do |t|
    t.integer "PARENT_ID"
    t.integer "LEFT_MARGIN"
    t.integer "RIGHT_MARGIN"
    t.integer "DEPTH_LEVEL"
    t.string "NAME"
    t.text "VALUE", size: :long
    t.text "ATTRIBUTES"
    t.index ["LEFT_MARGIN"], name: "ix_b_xml_tree_left"
    t.index ["PARENT_ID"], name: "ix_b_xml_tree_parent"
  end

end
