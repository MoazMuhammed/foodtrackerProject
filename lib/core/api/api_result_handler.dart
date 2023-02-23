abstract class ApiResults {}

class ApiSuccess extends ApiResults {
  dynamic data;

  ApiSuccess(this.data);

}
class ApiFailure extends ApiResults {
  String errorMessage;

  ApiFailure(this.errorMessage);
}
