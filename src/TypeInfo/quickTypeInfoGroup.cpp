#include "quickTypeInfoGroup.hpp"

namespace quick {

    namespace TypeInfo {

        Qml::Register::Type<Group> Group::Register;

        auto Group::setName(const QString& name) -> void {
            this->m_name = name;
        }

        auto Group::getName() -> QString {
            return this->m_name;
        }
    }
}