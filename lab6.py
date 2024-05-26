from sqlalchemy import create_engine, MetaData, func, and_, or_
from sqlalchemy.orm import sessionmaker
import json
from datetime import datetime

with open('config.json', 'r') as f:
    data = json.load(f)
    db_user = data['user']  # postgres
    db_password = data['password']

db_url = f'postgresql+pg8000://{db_user}:{db_password}@localhost:5432/hospital3'
engine = create_engine(db_url)

metadata = MetaData()
metadata.reflect(bind=engine)

Session = sessionmaker(bind=engine)
session = Session()

docs = metadata.tables['doctors']
specs = metadata.tables['specializations']
docsspecs = metadata.tables['doctorsspecializations']
vacations = metadata.tables['vacations']
departments = metadata.tables['departments']
sponsors = metadata.tables['sponsors']
donations = metadata.tables['donations']
wards = metadata.tables['wards']


def report_doctor_specializations():
    result = session.query(docs.c.name.label('doctorname'),
                           docs.c.surname,
                           specs.c.specialization_name) \
        .join(docsspecs, docsspecs.c.doctor_id == docs.c.id) \
        .join(specs, docsspecs.c.specialization_id == specs.c.id).all()

    if result:
        for row in result:
            print(f"{row.doctorname} {row.surname} with specialization {row.specialization_name}")


def report_doctors_salary_not_on_vacation():
    today = datetime.today().date()
    result = session.query(docs.c.surname,
                           (docs.c.salary + docs.c.premium).label('total_salary')) \
        .outerjoin(vacations, and_(
        docs.c.id == vacations.c.doctor_id,
        vacations.c.start_date <= today,
        vacations.c.end_date >= today
    )) \
        .where(vacations.c.id == None).all()

    if result:
        for row in result:
            print(f"Лікар: {row.surname} має таку зарплатню: {row.total_salary}")

def report_wards_department(department_id):
    result = session.query(wards.c.name.label('wardname')) \
        .where(wards.c.department_id == int(department_id)).all()

    if result:
        for row in result:
            print(f"Палата: {row.wardname}")


def report_donation_of_last_month(month, year):
    result = session.query(departments.c.name.label('department'),
                           sponsors.c.sponsor_name.label('sponsor'),
                           donations.c.donation_amount.label('amount'),
                           donations.c.donation_date.label('date')) \
        .join(donations, donations.c.department_id == departments.c.id) \
        .join(sponsors, donations.c.sponsor_id == sponsors.c.sponsor_id) \
        .where(and_(func.extract('month', donations.c.donation_date) == month,
                    func.extract('year', donations.c.donation_date) == year)).all()

    if result:
        for row in result:
            print(f"Відділення: {row.department}, Спонсор: {row.sponsor}, Сума пожертвування: {row.amount}, Дата пожертвування: {row.date}")


def report_departaments_donation(company_name):
    result = session.query(departments.c.name.label('department')) \
        .join(donations, departments.c.id == donations.c.department_id) \
        .join(sponsors, sponsors.c.sponsor_id == donations.c.sponsor_id) \
        .where(sponsors.c.sponsor_name == company_name).distinct().all()

    if result:
        for row in result:
            print(f"Відділення: {row.department}")



while True:
    print("1. Вивести повні імена лікарів та їх спеціалізації")
    print("2. Вивести прізвища та зарплати лікарів, які не перебувають у відпустці")
    print("3. Вивести назви палат, які знаходяться у певному відділенні;")
    print("4. Вивести усі пожертвування за вказаний місяць у вигляді: відділення, спонсор, сума пожертвування, дата пожертвування;")
    print("5. Вивести назви відділень без повторень, які спонсоруються певною компанією.")
    print("0. Вийти")
    choice = input("Оберіть опцію: ")

    if choice == "1":
        report_doctor_specializations()
    elif choice == "2":
        report_doctors_salary_not_on_vacation()
    elif choice == "3":
        department_id = input("Введіть ID відділення: ")
        report_wards_department(department_id)
    elif choice == "4":
        month = input("Введіть номер місяця (1-12): ")
        year = input("Введіть рік: ")
        report_donation_of_last_month(int(month), int(year))
    elif choice == "5":
        company_name = input("Введіть назву компанії: ")
        report_departaments_donation(company_name)

    elif choice == "0":
        break
    else:
        print("Невірний вибір. Будь ласка, оберіть знову.")

# Закриваємо сесію
session.close()
