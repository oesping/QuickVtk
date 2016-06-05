#pragma once

#include "quickQmlRegister.hpp"

#include <QAbstractListModel>
#include <QMetaObject>
#include <QColor>

namespace quick {

    namespace TypeInfo {

        class Group;

        class Item : public QAbstractListModel {
            Q_OBJECT
            Q_PROPERTY(QColor color READ getColor CONSTANT);
            Q_PROPERTY(QString type READ getType CONSTANT);
            Q_PROPERTY(QString name READ getName CONSTANT);
            Q_PROPERTY(QString prefix READ getPrefix CONSTANT);
        public:
            enum Roles {
                GroupRole = Qt::UserRole + 1
            };
        private:
            QColor m_color;
            QString m_type;
            QString m_name;
            QString m_prefix;
            QList<Group*> m_groups;
        public:
            static Qml::Register::Type<Item> Register;
            static auto GetEnumList() -> QStringList&;
            static auto MakeEnum(QMetaEnum) -> Item*;
            static auto MakeClass(QMetaObject) -> Item*;
            static auto MakeAbstract(QMetaObject) -> Item*;
            auto getColor() -> QColor;
            auto getType() -> QString;
            auto getName() -> QString;
            auto getPrefix() -> QString;
            auto matches(const QString&) -> bool;
            auto rowCount(const QModelIndex& = QModelIndex()) const -> int;
            auto data(const QModelIndex&, int) const -> QVariant;
            auto roleNames() const -> QHash<int, QByteArray>;
            void add(Group*);
            void clear();
        };
    }
}