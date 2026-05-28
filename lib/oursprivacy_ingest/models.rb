# frozen_string_literal: true

module OursprivacyIngest
  [
    OursprivacyIngest::Internal::Type::BaseModel,
    *OursprivacyIngest::Internal::Type::BaseModel.subclasses
  ].each do |cls|
    cls.define_sorbet_constant!(:OrHash) { T.type_alias { T.any(cls, OursprivacyIngest::Internal::AnyHash) } }
  end

  OursprivacyIngest::Internal::Util.walk_namespaces(OursprivacyIngest::Models).each do |mod|
    case mod
    in OursprivacyIngest::Internal::Type::Enum | OursprivacyIngest::Internal::Type::Union
      mod.constants.each do |name|
        case mod.const_get(name)
        in true | false
          mod.define_sorbet_constant!(:TaggedBoolean) { T.type_alias { T::Boolean } }
          mod.define_sorbet_constant!(:OrBoolean) { T.type_alias { T::Boolean } }
        in Integer
          mod.define_sorbet_constant!(:TaggedInteger) { T.type_alias { Integer } }
          mod.define_sorbet_constant!(:OrInteger) { T.type_alias { Integer } }
        in Float
          mod.define_sorbet_constant!(:TaggedFloat) { T.type_alias { Float } }
          mod.define_sorbet_constant!(:OrFloat) { T.type_alias { Float } }
        in Symbol
          mod.define_sorbet_constant!(:TaggedSymbol) { T.type_alias { Symbol } }
          mod.define_sorbet_constant!(:OrSymbol) { T.type_alias { T.any(Symbol, String) } }
        else
        end
      end
    else
    end
  end

  OursprivacyIngest::Internal::Util.walk_namespaces(OursprivacyIngest::Models)
                                   .lazy
                                   .grep(OursprivacyIngest::Internal::Type::Union)
                                   .each do |mod|
    const = :Variants
    next if mod.sorbet_constant_defined?(const)

    mod.define_sorbet_constant!(const) { T.type_alias { mod.to_sorbet_type } }
  end

  BatchCreateParams = OursprivacyIngest::Models::BatchCreateParams

  ExperimentAssignmentParams = OursprivacyIngest::Models::ExperimentAssignmentParams

  ExperimentPersonalizationParams = OursprivacyIngest::Models::ExperimentPersonalizationParams

  TrackEventParams = OursprivacyIngest::Models::TrackEventParams

  VisitorUpsertParams = OursprivacyIngest::Models::VisitorUpsertParams
end
