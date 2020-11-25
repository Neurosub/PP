using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;

namespace PP.Classes
{
    public class DBProcedures
    {
        private SqlCommand command = new SqlCommand("", DBConnection.connection);

        private void commandConfig(string config)
        {
            command.CommandType =
                System.Data.CommandType.StoredProcedure;
            command.CommandText = "[dbo].[" + config + "]";
            command.Parameters.Clear();
        }
         
        //Процедуры для персонала
        public void spStaff_insert(string Number, string Surname, string Name, string MiddleName, string Birthdate, Int32 Authorization_ID, Int32 Position_ID)
        {
            commandConfig("Staff_insert");
            command.Parameters.AddWithValue("@Number", Number);
            command.Parameters.AddWithValue("@Surname", Surname);
            command.Parameters.AddWithValue("@Name", Name);
            command.Parameters.AddWithValue("@MiddleName", MiddleName);
            command.Parameters.AddWithValue("@Birthdate", Birthdate);
            command.Parameters.AddWithValue("@Authorization_ID", Authorization_ID);
            command.Parameters.AddWithValue("@Position_ID", Position_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }
        public void spStaff_update(Int32 ID_Staff, string Number, string Surname, string Name, string MiddleName, string Birthdate, Int32 Authorization_ID, Int32 Position_ID)
        {
            commandConfig("Staff_update");
            command.Parameters.AddWithValue("@ID_Staff", ID_Staff);
            command.Parameters.AddWithValue("@Number", Number);
            command.Parameters.AddWithValue("@Surname", Surname);
            command.Parameters.AddWithValue("@Name", Name);
            command.Parameters.AddWithValue("@MiddleName", MiddleName);
            command.Parameters.AddWithValue("@Birthdate", Birthdate);
            command.Parameters.AddWithValue("@Authorization_ID", Authorization_ID);
            command.Parameters.AddWithValue("@Position_ID", Position_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void spStaff_delete(Int32 ID_Staff)
        {
            commandConfig("Staff_delete");
            command.Parameters.AddWithValue("@ID_Staff", ID_Staff);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        //Процедуры для листа персонала

        public void spStaffList_insert(Int32 Status_ID, Int32 Staff_ID)
        {
            commandConfig("StaffList_insert");
            command.Parameters.AddWithValue("@Status_ID", Status_ID);
            command.Parameters.AddWithValue("@Staff_ID", Staff_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }
        public void spStaffList_update(Int32 ID_StaffList, Int32 Status_ID, Int32 Staff_ID)
        {
            commandConfig("StaffList_update");
            command.Parameters.AddWithValue("@ID_StaffList", ID_StaffList);
            command.Parameters.AddWithValue("@Status_ID", Status_ID);
            command.Parameters.AddWithValue("@Staff_ID", Staff_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void spStaffList_delete(Int32 ID_StaffList)
        {
            commandConfig("StaffList_delete");
            command.Parameters.AddWithValue("@ID_StaffList", ID_StaffList);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }


        //Процедуры для регистрации

        public void UsersRegistration(string Login, string Password, string Surname, string Name, string MiddleName, string Birthdate, Int32 Authorization_ID)
        {
            commandConfig("Users_Registration");
            command.Parameters.AddWithValue("@Login", Login);
            command.Parameters.AddWithValue("@Password", Password);
            command.Parameters.AddWithValue("@Surname", Surname);
            command.Parameters.AddWithValue("@Name", Name);
            command.Parameters.AddWithValue("@MiddleName", MiddleName);
            command.Parameters.AddWithValue("@Birthdate", Birthdate);
            command.Parameters.AddWithValue("@Authorization_ID", Authorization_ID);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }


        //Процедуры для статуса
        public void spStatus_insert(string Name)
        {
            commandConfig("Status_insert");
            command.Parameters.AddWithValue("@Name", Name);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }
        public void spStatus_update(Int32 ID_Status, string Name)
        {
            commandConfig("Status_update");
            command.Parameters.AddWithValue("@ID_Status", ID_Status);
            command.Parameters.AddWithValue("@Name", Name);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void spStatus_delete(Int32 ID_Status)
        {
            commandConfig("Status_delete");
            command.Parameters.AddWithValue("@ID_Status", ID_Status);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }
        //Процедуры для должности
        public void spPosition_insert(string Name)
        {
            commandConfig("Position_insert");
            command.Parameters.AddWithValue("@Name", Name);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }
        public void spPosition_update(Int32 ID_Position, string Name)
        {
            commandConfig("Position_update");
            command.Parameters.AddWithValue("@ID_Position", ID_Position);
            command.Parameters.AddWithValue("@Name", Name);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

        public void spPosition_delete(Int32 ID_Position)
        {
            commandConfig("Position_delete");
            command.Parameters.AddWithValue("@ID_Position", ID_Position);
            DBConnection.connection.Open();
            command.ExecuteNonQuery();
            DBConnection.connection.Close();
        }

    }
}