


class BaseResponse<T>  {
   int code;
   String message;
   String errorMsg;
   bool success;
   T data;

   BaseResponse(this.code, this.message, this.errorMsg, this.success,
       this.data);
}
