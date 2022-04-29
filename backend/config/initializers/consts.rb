#==========
# SUCCES
#==========
SUCCESS_OK                          = 'OK.'
SUCCESS_REGISTERED_SUCCESSFULLY     = 'Data Registered Correctly.'
SUCCESS_RECORD_UPDATED_SUCCESSFULLY = 'Data Updated Correctly.'
SUCCESS_RECORD_DELETED_SUCCESSFULLY = 'Registered Deleted Successfully.'
SUCCESS_QUERY_WITHOUT_RESULTS       = 'There are no results for this query.'

#==========
# ERRORES
#==========
ERROR_INSUFFICIENT_PARAMETERS  = 'The supplied parameters are not sufficient.'
ERROR_DUPLICATE_RECORD         = 'A record already exists with the data provided.'
ERROR_OF_PERMISSIONS           = 'You do not have permissions to execute this action.'
ERROR_INTERNAL_SERVER          = 'Unknown bug.'
ERROR_RECORD_NOT_EXISTS        = 'There are no records with the provided parameters.'
ERROR_FIELD_CANNOT_BE_EMPTY    = 'It cant be empty.'
ERROR_REGISTRATION_NOT_ALLOWED = 'registration not allowed.'
ERROR_ACTION_NOT_ALLOWED       = 'Action not allowed.'


#===================================
# RESPUESTA PRE - DISñADAS
#===================================
API_ACTION_NOT_ALLOWED                  = { msg: ERROR_ACTION_NOT_ALLOWED, error: true, status: 401, data: nil,detail: ""}
API_REGISTRATION_NOT_ALLOWED            = { msg: ERROR_REGISTRATION_NOT_ALLOWED, error: true, status: 401, data: nil,detail: ""}
API_ERROR_INTERNAL_SERVER               = { msg: ERROR_INTERNAL_SERVER, error: true, status: 401, data: nil ,detail: ""}
API_ERROR_INSUFFICIENT_PARAMETERS       = { msg: ERROR_INSUFFICIENT_PARAMETERS, error: true, status: 401, data: nil ,detail: ""}
API_ERROR_DUPLICATE_RECORD              = { msg: ERROR_DUPLICATE_RECORD, error: true, status: 401, data: nil ,detail: ""}
API_ERROR_RECORD_NOT_EXISTS             = { msg: ERROR_RECORD_NOT_EXISTS, error: true, status: 404, data: nil ,detail: ""}
API_SUCCESS_OK                          = { msg: SUCCESS_OK, error: false, status: 201, data: nil ,detail: ""}
API_SUCCESS_RECORD_UPDATED_SUCCESSFULLY = { msg: SUCCESS_RECORD_UPDATED_SUCCESSFULLY, error: false, status: 201, data: nil ,detail: ""}
API_SUCCESS_RECORD_DELETED_SUCCESSFULLY = { msg: SUCCESS_RECORD_DELETED_SUCCESSFULLY, error: false, status: 201, data: nil ,detail: ""}
API_SUCCESS_REGISTERED_SUCCESSFULLY     = { msg: SUCCESS_REGISTERED_SUCCESSFULLY, error: false, status: 201, data: nil ,detail: ""}
API_SUCCESS_QUERY_WITHOUT_RESULTS       = { msg: SUCCESS_QUERY_WITHOUT_RESULTS, error: false, status: 201, data: nil ,detail: ""}
API_SUCCESS_QUERY_OK                    = { msg: SUCCESS_OK, error: false, status: 201, data: nil ,detail: ""}