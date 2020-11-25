using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;

namespace PP.Classes
{
    public class DBConnection
    {
        public static SqlConnection connection = new SqlConnection(             
               @"Data Source = DESKTOP-T819KVA\SQLEXPRESS; " +
              " Initial Catalog = PP_DEMO; Persist Security Info = true;" +
              " User ID = sa; Password = \"psl14082001\"");

        //Таблица персонал (Запрос работает?)
        public DataTable dtStaff = new DataTable("Staff");
        public static string qrStaff = "SELECT [ID_Staff], [Number] as \"Номер\"," +
            "[Surname] as \"Фамилия\", [dbo].[Staff].[Name] as \"Имя\", [MiddleName] as \"Отчество\", [Birthdate] as \"Дата рождения\"," +
            "[dbo].[Staff].[Position_ID], [dbo].[Position].[Name] as \"Название должности\"," +
            "[dbo].[Staff].[Authorization_ID], [Login] as \"Логин\", [Password] as \"Пароль\"  FROM [dbo].[Staff]" +
            " INNER JOIN [dbo].[Position] ON [dbo].[Staff].[Position_ID] = [dbo].[Position].[ID_Position]" +
            " INNER JOIN [dbo].[Authorization] ON [dbo].[Staff].[Authorization_ID] = [dbo].[Authorization].[ID_Authorization]";
        //Таблица авторизация (Запрос работает?)
        public DataTable dtAuthorization = new DataTable("Authorization");
        public static string qrAuthorization = "SELECT [ID_Authorization], [Login] as \"Логин\", [Password] as \"Пароль\"";
        //Таблица статус (Запрос работает?)
        public DataTable dtStatus = new DataTable("Status");
        public static string qrStatus = "SELECT [ID_Status], [Name] as \"Название\" FROM [dbo].[Status]";
        //Таблица должность (Запрос работает?)
        public DataTable dtPosition = new DataTable("Position");
        public static string qrPosition = "SELECT [ID_Position], [Name] as \"Название\" FROM [dbo].[Position]";
        //Таблица список персонала (Запрос работает?)
        public DataTable dtStaffList = new DataTable("StaffList");
        public static string qrStaffList = "SELECT [ID_StaffList], " +
            "[dbo].[StaffList].[Status_ID], [Name] as \"Название статуса\"," +
            "[dbo].[StaffList].[Staff_ID], [Number] as \"Номер сотрудника\", FROM [dbo].[StaffList]";

        public void dbEnter(string login, string password)
        {
            command.CommandText = "SELECT count(*) FROM [dbo].[Authorization] " +
                "where [Login] = '" + login + "' and [Password] = '" +
                password + "'";
            connection.Open();
            IDuser = Convert.ToInt32(command.ExecuteScalar().ToString());
            connection.Close();
        }

        public static Int32 ID_User = 0;
        private SqlCommand command = new SqlCommand("", connection);
        public static Int32 IDStaff, IDAuth, IDStatus, IDPos, IDStaffList, IDuser;
        private void dtFill(DataTable table, string query)
        {
            command.CommandText = query;
            connection.Open();
            table.Load(command.ExecuteReader());
            connection.Close();

        }
        public void StaffFill()
        {
            dtFill(dtStaff, qrStaff);
        }
        public void AuthorizationFill()
        {
            dtFill(dtAuthorization, qrAuthorization);
        }
        public void StatusFill()
        {
            dtFill(dtStatus, qrStatus);
        }
        public void PositionFill()
        {
            dtFill(dtPosition, qrPosition);
        }
        public void StaffListFill()
        {
            dtFill(dtStaffList, qrStaffList);
        }
    }
}