// Claim the app for your business (app should be whitelisted for ads api access)
curl -X POST \
-F "app_id=123456789" \
-F "access_type=OWNER" \
-F "access_token=<business_admin_user_and_ads_api_app_pair_token>" \
"https://graph.facebook.com/<business_id>/apps"

// Create Admin System User
curl -X POST \
-F "name=Ad Server" \
-F "role=ADMIN_SYSTEM_USER" \
-F "access_token=<business_admin_user_and_ads_api_app_pair_token>" \
"https://graph.facebook.com/<business_id>/system_users"

// Tos the app for the admin system user
curl -X POST \
-F "business_app=1243595696" \
-F "access_token=<business_admin_user_and_ads_api_app_pair_token>" \
"https://graph.facebook.com/<admin_system_user_id>/applications"

// Genereate admin system user token (proof should be calculated for the caller app not the app in parameter)
curl -X POST \
-F "business_app=1243595696" \
-F "scope=ads_management,manage_pages" \
-F "appsecret_proof=<hmac_of_appsecret_token_of_calling_app>" \
-F "access_token=<business_admin_user_and_ads_api_app_pair_token>" \
"https://graph.facebook.com/<admin_system_user_id>/ads_access_token"

// Create an adaccount
curl -X POST \
-F "name=MyAdAccount" \
-F "currency=USD" \
-F "timezone_id=1" \
-F "end_advertiser=my company" \
-F "media_agency=123456" \
-F "partner=NONE" \
-F "access_token=<admin_system_user_token>" \
"https://graph.facebook.com/<business_id>/partneradaccount"

// Create Regular System User
curl -X POST \
-F "name=Ad Server" \
-F "role=SYSTEM_USER" \
-F "access_token=<admin_system_user_token>" \
"https://graph.facebook.com/<business_id>/system_users"

// Tos the app for the regular system user
curl -X POST \
-F "business_app=1243595696" \
-F "access_token=<admin_system_user_token>"" \
"https://graph.facebook.com/<regular_system_user_id>/applications"

// Genereate regular system user token (proof should be calculated for the caller app not the app in parameter)
curl -X POST \
-F "business_app=1243595696" \
-F "scope=ads_management,manage_pages" \
-F "appsecret_proof=<hmac_of_appsecret_token_of_calling_app>" \
-F "access_token=<admin_system_user_token>"" \
"https://graph.facebook.com/<regular_system_user_id>/ads_access_token"

// Assign permission to adaccount for system user
curl -X POST \
-F "user=<regular_system_user_id>" \
-F "role=ADMIN" \
-F "business=<business_id>" \
-F "access_token=<admin_system_user_token>" \
"https://graph.facebook.com/<act_adaccount_id>/userpermissions"

// Make call on the adaccount
curl -G \
-d "access_token=<regular_system_user_token>" \
"https://graph.facebook.com/adaccount_id/stats"
