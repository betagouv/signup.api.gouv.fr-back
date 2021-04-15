class Enrollment::LeTaxiChauffeurs < Enrollment
  def sent_validation
    contact = contacts&.find { |e| e["id"] == "metier" }
    errors[:contacts] << "Vous devez renseigner un chargé de suivit avant de continuer" unless contact&.fetch("email", false)&.present?

    rgpd_validation

    errors[:description] << "Vous devez renseigner la description de la démarche avant de continuer" unless description.present?
    errors[:siret] << "Vous devez renseigner un SIRET d’organisation valide avant de continuer" unless nom_raison_sociale.present?
    errors[:cgu_approved] << "Vous devez valider les modalités d’utilisation avant de continuer" unless cgu_approved?
  end
end
