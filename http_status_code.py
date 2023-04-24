""" This class of status code indicates that the client's request was successfully received """
class StatusCode:
    HTTP_200_OK=200
    HTTP_201_CREATED=201
    HTTP_202_ACCEPTED=202
    HTTP_203_NON_AUTHORITATIVE_INFORMATION=203
    HTTP_204_NO_CONTENT=204
    HTTP_205_RESET_CONTENT=205
    HTTP_206_PARTIAL_CONTENT=206

    """  client seems to have erred """
    HTTP_400_BAD_REQUEST=400
    HTTP_401_UNAUTHORIZED=401
    HTTP_403_FORBIDDEN=403
    HTTP_404_NOT_FOUND=404
    HTTP_405_METHOD_NOT_ALLOWED=405
    HTTP_406_NOT_ACCEPTABLE=406
    HTTP_407_PROXY_AUTHENTICATION_REQUIRED=407
    HTTP_408_REQUEST_TIMEOUT=408
    HTTP_409_CONFLICT=409
    HTTP_411_LENGTH_REQUIRED=411
    HTTP_413_REQUEST_ENTITY_TOO_LARGE=413
    HTTP_414_REQUEST_URI_TOO_LONG=414
    HTTP_416_REQUESTED_RANGE_NOT_SATISFIABLE=416
    HTTP_417_EXPECTATION_FAILED=417
    HTTP_428_PRECONDITION_REQUIRED=428
    HTTP_429_TOO_MANY_REQUESTS=429

    """ the server is aware that it has erred or is incapable of performing the request """
    HTTP_500_INTERNAL_SERVER_ERROR=500
    HTTP_501_NOT_IMPLEMENTED=501
    HTTP_502_BAD_GATEWAY=502
    HTTP_503_SERVICE_UNAVAILABLE=503
    HTTP_504_GATEWAY_TIMEOUT=504
    HTTP_505_HTTP_VERSION_NOT_SUPPORTED=505
    HTTP_511_NETWORK_AUTHENTICATION_REQUIRED=511