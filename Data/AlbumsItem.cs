//------------------------------------------------------------------------------
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
    using System.Collections.Generic;
    
    public partial class AlbumsItem
    {
        public int Id { get; set; }
        public int AlbumId { get; set; }
        public int LangId { get; set; }
        public string Title { get; set; }
        public string Description { get; set; }
        public string YoutubeVideo { get; set; }
        public string ItemType { get; set; }
        public string Image { get; set; }
        public string MobileImage { get; set; }
        public string Fileitem { get; set; }
        public string Videoitem { get; set; }
        public int OrderDisplay { get; set; }
        public bool isDeleted { get; set; }
        public bool isHidden { get; set; }
        public System.DateTime CreatedDate { get; set; }
    
        public virtual Album Album { get; set; }
        public virtual Language Language { get; set; }
    }
}
