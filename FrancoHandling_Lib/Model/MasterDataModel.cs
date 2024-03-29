﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace FrancoHandling_Lib.Model
{
    public class MasterDataModel
    {
        public class AuthParameter
        {
            public Guid User_ID { get; set; }
            public string ParameterName { get; set; }
            public string ParameterValue { get; set; }
        }

        public class MasterDataDriver
        {
            public int Driver_ID { get; set; }
            public Int64 Photo_ID { get; set; }
            public int Transporter_ID { get; set; }
            public string TransporterName { get; set; }
            public string ImageName { get; set; }
            public byte[] ImageBytes { get; set; }
            public string Name { get; set; }
            public string Address { get; set; }
            public DateTime? Birthday { get; set; }
            public string Phone1 { get; set; }
            public string Phone2 { get; set; }
            public string Email { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }

        public class MasterDataDistance
        {
            public int TBBM_ID { get; set; }
            public string SPSH_ID { get; set; }
            public string TBBMName { get; set; }
            public string SPSHName { get; set; }
            public Decimal Distance { get; set; }
            public Decimal NormalRate { get; set; }
            public Decimal SpecialRate { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }

        public class MasterDataKendaraan
        {
            public int Vehicle_ID { get; set; }
            public int Transporter_ID { get; set; }
            public string TransporterName { get; set; }
            public Int16 Type_ID { get; set; }
            public string VehicleType { get; set; }
            public string Number { get; set; }
            public string Code { get; set; }
            public int Capacity { get; set; }
            public int UnitCapacity_ID { get; set; }
            public string UnitCapacity { get; set; }
            public string Merk { get; set; }
            public int YearManufacture { get; set; }
            public Int16 VehicleCategory_ID { get; set; }
            public string VehicleCategory { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }

        public class MasterDataProduct
        {
            public int Product_ID_PK { get; set; }
            public string Name { get; set; }
            public string Description { get; set; }
        }

        public class MasterDataRegion
        {
            public int Region_ID { get; set; }
            public string RegionName { get; set; }
        }

        public class MasterDataRole
        {
            public Guid RoleID { get; set; }
            public string RoleName { get; set; }
        }

        public class MasterDataSPSH
        {
            public string SPSH_ID { get; set; }
            public string NewSPSH_ID { get; set; }
            public byte Region_ID { get; set; }
            public string RegionName { get; set; }
            public string Name { get; set; }
            public string Address { get; set; }
            public string Telp { get; set; }
            public string Email { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }


        public class MasterDataTBBM
        {
            public int TBBM_ID_PK { get; set; }
            public byte Region_ID_FK { get; set; }
            public string RegionName { get; set; }
            public string Name { get; set; }
            public string Address { get; set; }
            public string Telp { get; set; }
            public string Email { get; set; }
            public bool IsActive { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }

        public class MasterDataTransporter
        {
            public int Transporter_ID { get; set; }
            public string SAP_ID { get; set; }
            public string TransporterName { get; set; }
            public string Address { get; set; }
            public string Phone { get; set; }
            public string Email { get; set; }
            public string Contact1 { get; set; }
            public string Contact2 { get; set; }
            public int Capacity { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }

        public class MasterDataTransporterFee
        {
            public int Transporter_ID { get; set; }
            public byte Region_ID { get; set; }
            public string RegionName { get; set; }
            public decimal HandlingFee { get; set; }
            public int OATDistanceLimit { get; set; }
            public decimal OATPriceUnderEqualLimit { get; set; }
            public decimal OATPriceAboveLimit { get; set; }
            public DateTime CreationDate { get; set; }
            public string CreationBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public string UpdateBy { get; set; }
        }

        public class MasterDataUser
        {
            public Guid UserID { get; set; }
            public string Username { get; set; }
            public string Password { get; set; }
            public string Email { get; set; }
            public string Telephone { get; set; }
            public bool IsActive { get; set; }
            public string CreationBy { get; set; }
            public DateTime CreationDate { get; set; }
            public string UpdateBy { get; set; }
            public DateTime UpdateDate { get; set; }
            public Guid RoleID { get; set; }
            public string RoleName { get; set; }
        }

        public class MasterDataForce
        {
            public string Force { get; set; }
        }

        public class MasterDataUnity
        {
            public string Unity { get; set; }
        }
    }
}
