String? descriptionValidator(String? description) {
  if (description == null || description.isEmpty) {
    return 'Digite uma descrição!';
  }
  return null;
}
