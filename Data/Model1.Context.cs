﻿//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Data
{
    using System;
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class IMDGEntities : DbContext
    {
        public IMDGEntities()
            : base("name=IMDGEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<Admin> Admins { get; set; }
        public virtual DbSet<AlbumContent> AlbumContents { get; set; }
        public virtual DbSet<Album> Albums { get; set; }
        public virtual DbSet<AlbumsItem> AlbumsItems { get; set; }
        public virtual DbSet<Language> Languages { get; set; }
        public virtual DbSet<Log> Logs { get; set; }
        public virtual DbSet<PageContentTypeField> PageContentTypeFields { get; set; }
        public virtual DbSet<PageContentTypesId> PageContentTypesIds { get; set; }
        public virtual DbSet<Page> Pages { get; set; }
        public virtual DbSet<PagesContent> PagesContents { get; set; }
        public virtual DbSet<PagesContentType> PagesContentTypes { get; set; }
        public virtual DbSet<PagesFriendlyUrl> PagesFriendlyUrls { get; set; }
        public virtual DbSet<PagesGallery> PagesGalleries { get; set; }
        public virtual DbSet<PageTemplate> PageTemplates { get; set; }
        public virtual DbSet<UserAddress> UserAddresses { get; set; }
        public virtual DbSet<User> Users { get; set; }
        public virtual DbSet<Subscriber> Subscribers { get; set; }
    }
}