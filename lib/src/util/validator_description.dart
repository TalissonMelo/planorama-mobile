String? descriptionValidator(String? description) {
  if (description == null || description.isEmpty) {
    return 'Enter a description!';
  }
  return null;
}
