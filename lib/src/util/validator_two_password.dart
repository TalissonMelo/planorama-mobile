bool passwordConfirmValidator(String password, String passwordConfirm) {
  if (password != passwordConfirm) {
    return false;
  }

  return true;
}
